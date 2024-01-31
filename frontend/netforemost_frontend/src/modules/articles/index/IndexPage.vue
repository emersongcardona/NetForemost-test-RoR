<template>
  <div>
    <p>Aquí irán los artículos</p>
  </div>
  <div>
    
    <h1 v-if="articleStore.loading"> LOADING</h1>
    
    <ArticleList v-else :articles="articleStore.articles"/>
  </div>
</template>
  
<script setup>
import { onMounted } from "vue";
import ArticleList from "@/modules/articles/index/components/ArticleList.vue";
import { useArticleStore } from "@/store/article-store";

const articleStore = useArticleStore();
onMounted(()=>{
    articleStore.getArticles();
}) 
</script>
  
  <style scoped>
</style>
  