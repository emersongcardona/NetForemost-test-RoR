class ArticlesController < ApplicationController
    require_relative '../services/news_api/news_service'

    def index
        if Article.count < 20
            news_api = NewsApiClient.new
            articles = news_api.get_news['articles']
            articles.each do |article_data|
                article_data['source'] = article_data['source']['name']
                Article.create(article_data);
            end
        end

        render json: Article.all
    end
end
  