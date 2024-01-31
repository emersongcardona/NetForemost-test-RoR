<template>
  <div>
    <pre v-if="articleStore.article">{{ articleStore.article }}</pre>
    <h1 v-else>articulo no encontrado</h1>
  </div>
</template>
    
  <script setup>
import { onMounted } from "vue";
import { useRoute } from "vue-router";
import { useArticleStore } from "@/store/article-store";

const route = useRoute();
const articleStore = useArticleStore();
onMounted(() => {
  if (!articleStore.articles.length) {
    articleStore.getArticles();
  }

  articleStore.setArticleById(route.params.articleId);
});
</script>
    
    <style scoped>
</style>
    