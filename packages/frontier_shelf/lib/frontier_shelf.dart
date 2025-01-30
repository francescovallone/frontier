import 'package:frontier/frontier.dart';
import 'package:shelf/shelf.dart';

final frontier = Frontier();

Middleware frontierMiddleware(
  String strategy,
  Future<StrategyRequest> Function(Request request) dataFromReq,
  { String unauthorizedMessage = 'The authentication failed!' }
) {
  return (Handler innerHandler) {
    return (request) async {
      final data = await dataFromReq(request);
      final value = await frontier.authenticate(strategy, data);
      if(value == null || value == false) {
        return Response.unauthorized(unauthorizedMessage, context: request.context);
      }
      final changedRequest = request.change(context: { 'frontier.$strategy': value });
      return await innerHandler.call(changedRequest);
    };
  };
}