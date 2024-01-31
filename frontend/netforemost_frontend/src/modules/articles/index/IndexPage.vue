<template>
  <div class="logoAndCompany">
    <img src="@/../public/images/newsLogo.svg" alt="newsLogo" />
    <h1>NetForemost News</h1>
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
.logoAndCompany {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
}


</style>


