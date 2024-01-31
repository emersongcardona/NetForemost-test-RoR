import { defineStore } from "pinia";
import { ref } from "vue";
import { newsApi } from "@/api/newsApi";
import { format } from "date-fns";

export const useArticleStore = defineStore("article.store", () => {
    const article = ref(null);
    const articles = ref([]);
    const loading = ref(false);

    async function getArticles() {
        try {
            loading.value = true;
            const { data } = await newsApi.get("/articles");
            articles.value = data.map((article) => ({
                ...article,
                publishedAt: formatDate(article.publishedAt),
                time: formatTime(article.publishedAt)
            }));
        } catch (error) {
            console.error("Error gettting the articles from API:", error);
        } finally {
            loading.value = false;
        }
    }

    async function showArticle(id) {
        try {
            loading.value = true;
            const {data} = await newsApi.get(`/articles/${id}`);
            data.publishedAt = formatDate(data.publishedAt);
            data.time = formatTime(data.publishedAt);
            article.value = data;
        } catch (error) {
            console.error("Error showing the article from API:", error);
        } finally {
            loading.value = false;
        }
    }

    function formatDate(dateString) {
        const dateObject = new Date(dateString);
        return format(dateObject, "MMMM d, yyyy");
    }

    function formatTime(timeString) {
        const dateObject = new Date(timeString);
        return format(dateObject, "h:mm a");
    }


    return { articles, getArticles, loading, article, formatTime, showArticle};
});
