<template>
<div class="articles">
    <ArticleItem
        v-for="article in articles"
        :key="article.id" 
        :article="article"
    />
</div>
</template>
    
<script setup>
import ArticleItem from "@/modules/articles/index/components/ArticleItem.vue";
import {defineProps} from "vue"
defineProps({
    articles: {
        type: Array,
        required: true,
    },
});
</script>
    
<style scoped>
.articles{
    display: flex;
    flex-direction: column;
    gap: 30px;
    padding: 0 10px 0 10px;

}
</style>
    
