<script setup>
const strategies = [
    {
        title: 'frontier_basic',
        description: 'Frontier strategy for authenticating with a username and password.',
        featured: true,
        href: 'https://pub.dev/packages/frontier_basic'
    }, 
    {
        title: 'frontier_jwt',
        description: 'Frontier strategy for authenticating with a JSON Web Token.',
        featured: true,
        href: 'https://pub.dev/packages/frontier_jwt'
    },
    {
        title: 'frontier_openid',
        description: 'Frontier strategy for authenticating with OpenID',
        featured: true,
        href: 'https://pub.dev/packages/frontier_openid'
    },
]
</script>

<template>
    <div>
		<header class="flex flex-col justify-center items-center max-w-7xl gap-3 w-full mx-auto pt-20 pb-4">
			<h1 class="text-5xl font-bold">
				Strategies
			</h1>
		</header>
		<main class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 max-w-4xl mx-auto gap-4 w-full my-4 p-1">
			<a v-for="strategy in strategies"
                :href="strategy.href"
				class="rounded-lg transition-all flex grow border-2"
                style="border-color: var(--vp-c-brand-1-dark)"
				:key="strategy.title + strategy.href">
				<div class="flex flex-col gap-4 p-4">
					<h3 class="text-md uppercase font-bold" style="color: var(--vp-c-brand-1-darker)">{{ strategy.title }}</h3>
                    <p class="my-0 text-sm">{{ strategy.description }}</p>
                    <p class="justify-self-end self-end font-medium text-sm uppercase" style="color: var(--vp-c-brand-1)" v-if="strategy.featured">Featured</p>
				</div>
			</a>
		</main>
	</div>
</template>