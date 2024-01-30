require 'httparty'
class NewsApiClient
  include HTTParty
  base_uri 'https://newsapi.org/v2'

  def initialize
    @api_key = ENV['NEWS_API_KEY']
    raise 'API key not configured' unless @api_key
  end

  def get_news
    options = {
      query: {
        pageSize: 20,
        q: "technology",
        language: 'en',
        apiKey: @api_key
      }
    }

    response = self.class.get('/everything', options)
  end
end
