require 'rails_helper'
require_relative '../../app/services/news_api/news_service'

RSpec.describe NewsApiClient, type: :service do
    describe '#get_news' do
      it 'returns news articles' do
        news_api = NewsApiClient.new
        articles = news_api.get_news['articles']
        expect(articles).to be_an(Array)
      end

      it 'wrong Api petition  returns null articles'
        news_api = NewsApiClient.new
        articles = news_api.get_news['']
        puts "articles :  #{articles}"
        expect(articles).to be_nil
      end
    end
end