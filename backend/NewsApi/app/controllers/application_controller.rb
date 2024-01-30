class ApplicationController < ActionController::API

    def index
        news_service = NewsService.new(ENV['NEWS_API_KEY'])
    
        # Obtener top headlines
        @top_headlines = news_service.get_top_headlines(language: 'en')
    
        # Obtener everything
        @all_articles = news_service.get_everything( language: 'en')
    
        # Obtener sources
        @sources = news_service.get_sources(language: 'en')
    
        render json: {
          top_headlines: @top_headlines,
          all_articles: @all_articles,
          sources: @sources
        }
      end
end
