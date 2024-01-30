news_service = NewsApiService.new

while Article.count < 20
  news_service.fetch_and_store_articles
end