<template>
  <router-link
    :to="{ name: 'show', params: { articleId: article.id } }"
    class="article"
  >
    <h2>{{ article.title }}</h2>
    <p><strong>By </strong> {{ article.author }}</p>
    <p class="published-at">{{ article.publishedAt }}</p>
    <p class="source">{{ article.source }}</p>
    <img
      :src="article.urlToImage"
      alt="Imagen del artículo"
      class="article-image"
    />
    <p>
      <strong>URL:</strong>
      <a :href="article.url" target="_blank">{{ article.url }}</a>
    </p>
    <p><strong>Contenido:</strong> {{ article.contenido }}</p>
  </router-link>
</template>
  
<script setup>
import { defineProps } from 'vue';
defineProps({
  article: {
    type: Object,
    required: true,
  },
});
</script>
  
  <style scoped>
.article-image {
  width: 137px;
  height: 172px;
  border-radius: 10px;
}

.published-at {
  font-family: "SF Pro", sans-serif;
  font-size: 13px;
  font-weight: 510;
  line-height: 23px;
  letter-spacing: -0.16500000655651093px;
  text-align: left;
  color: #909090;
}

.source {
  font-family: "SF Pro", sans-serif;
  font-size: 13px;
  font-weight: 700;
  line-height: 16px;
  letter-spacing: -0.16500000655651093px;
  text-align: left;
  color: #69bdfd;
}
</style>
  