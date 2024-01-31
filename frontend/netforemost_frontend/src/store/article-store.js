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

    function formatDate(dateString) {
        const dateObject = new Date(dateString);
        return format(dateObject, "MMMM d, yyyy");
    }

    function formatTime(timeString) {
        const dateObject = new Date(timeString);
        return format(dateObject, "h:mm a");
    }



    function setArticleById(id) {
        article.value = articles.value.find((article) => article.id === parseInt(id));
    }

    return { articles, getArticles, loading, setArticleById, article, formatTime};
});
