# app/services/news_service.rb

require 'news-api'

class NewsService
    def initialize(api_key)
        api_key = ENV['NEWS_API_KEY']
        raise 'could not find api key.' if api_key.blank?
        @newsapi = News.new(api_key)
    end

    def get_top_headlines(options = {})
        @newsapi.get_top_headlines(options)
    end

    def get_everything(options = {})
        @newsapi.get_everything(options)
    end

    def get_sources(options = {})
        @newsapi.get_sources(options)
    end

    def fetch_and_store_articles
        articles_data = @newsapi.get_everything(language: 'en')
        if articles_data.present? && articles_data['articles'].present?
            Article.create(articles_data['articles'])
        end
    end
end
