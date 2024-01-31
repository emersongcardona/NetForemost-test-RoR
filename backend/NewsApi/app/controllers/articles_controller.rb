class ArticlesController < ApplicationController
    require_relative '../services/news_api/news_service'
    before_action :set_article, only: [:show]

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


    def show
        puts "article #{@article}"
        render json: @article
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

end
