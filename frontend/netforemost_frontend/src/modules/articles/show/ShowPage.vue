<template>
    <div>
        <router-link :to="{ name: 'index' }" class="backButtom"
        ><strong>&lt;</strong></router-link
        >
        <template v-if="!articleStore.loading && articleStore.article">
        <img
            :src="articleStore.article.urlToImage"
            alt="Imagen del artículo"
            class="article-image"
        />
        <div class="container">
            <h1 class="title">{{ articleStore.article.title }}</h1>
            <div class="authorAndDate">
            <p class="author">By {{ articleStore.article.author }}</p>
            <p class="published-at">{{ articleStore.article.publishedAt }}</p>
            <p class="published-at-time">{{ articleStore.article.time }}</p>
            </div>
            <p class="content">{{ articleStore.article.content }}</p>
        </div>
        </template>
        <h1 v-else>Loading</h1>
    </div>
</template>
    
<script setup>
import { onMounted } from "vue";
import { useRoute } from "vue-router";
import { useArticleStore } from "@/store/article-store";

const route = useRoute();
const articleStore = useArticleStore();
onMounted(() => {
    articleStore.showArticle(route.params.articleId);
});
</script>
    
<style scoped>
.backButtom {
    font-size: 24px;
    font-weight: 24px;
    margin-left: 20px;
    text-decoration: none;
    color: #180e19;
}

img {
    width: 100%;
    height: 229px;
}

.title {
    font-size: 18px;
    font-weight: 700px;
    line-height: 25px;
}

.container {
    padding: 0 16px 0 16px;
}

.published-at-time {
    font-size: 13px;
    font-weight: 510;
    line-height: 23px;
    color: #909090;
    margin-top: 30px;
    position: absolute;
    right: 0;
    padding-right: 16px;
}

.content {
    font-size: 15px;
    font-weight: 510;
    line-height: 25px;
    color: #000000;
    margin-top: 30px;
    position: absolute;
    right: 0;
    padding-right: 16px;
    padding-left: 16px;
}

.published-at {
    position: absolute;
    right: 0;
    padding-right: 16px;
}

.authorAndDate {
    display: grid;
    grid-template-columns: 1fr 1fr;
    align-items: center;
    width: 211px;
    height: 49px;
}
</style>
    