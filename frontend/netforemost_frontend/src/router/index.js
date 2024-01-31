import { createRouter,  createWebHashHistory } from "vue-router"

const router = createRouter({
	history: createWebHashHistory(),
	routes: [
		{
			path: "/",
			name: "index",
			component: () => import("@/modules/articles/index/IndexPage.vue"),
		},
        {
			path: "/:articleId",
			name: "show",
			component: () => import("@/modules/articles/show/ShowPage.vue"),
		},
	],
})

export default router
