<template>
    <div class="container">
        <div class="article">
        <img
            :src="article.urlToImage"
            alt="Imagen del artículo"
            class="article-image"
        />
        <div class="article-info">
            <div class="titleAndAuthor">
                <h2>{{ article.title }}</h2>
                <p class="author">By {{ article.author }}</p>
            </div>
            <div class="sourceAndDate">
                <p class="source">{{ article.source }}</p>
                <router-link :to="{ name: 'show', params: { articleId: article.id } }" class="goToArticle" ><strong> ... </strong></router-link>
                <p class="published-at">{{ article.publishedAt }}</p>
            </div>
            </div>
        </div>
        <div class="line"></div>
    </div>
</template>

<script setup>
import { defineProps } from "vue";
defineProps({
    article: {
        type: Object,
        required: true,
    },
});
</script>

<style scoped>
h2 {
    font-size: 14px;
    text-decoration: none;
    font-weight: 700;
    color: #000000;
    line-height: 20px;
}

a {
    text-decoration: none;
}

.titleAndAuthor {
    width: 211px;
    height: 133px;
    margin-bottom: 10px;
}

.sourceAndDate {
    display: grid;
    grid-template-columns: 1fr 1fr; 
    align-items: center; 
    width: 211px;
    height: 49px;
    margin-top: -30px;
}

.goToArticle{
    font-size: 25px;
    justify-self: end;

}
.published-at {
    font-size: 13px;
    font-weight: 510;
    line-height: 23px;
    color: #909090;
    margin-top: -15px;
}

.source {
    font-size: 13px;
    font-weight: 700;
    line-height: 16px;
    color: #69bdfd;
}

.author {
    font-weight: 510;
    line-height: 22.5px;
    color: #909090
}

.article {
    width: 100%;
    height: 200px;
    display: flex;
    gap: 15px;
    margin-bottom: 20px;
}

.article-image {
    width: 40%;
    height: 100%;
    border-radius: 10px;
    object-fit: cover;
}

.article-info {
    width: 60%;
    height: 100%;
}

.line {
    width: 100%;
    border-top: 1px solid #EEEEEE;
}
</style>
