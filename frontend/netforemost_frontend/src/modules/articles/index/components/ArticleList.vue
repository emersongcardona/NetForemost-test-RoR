<template>
<div>
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
</style>
    