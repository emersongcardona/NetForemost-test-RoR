require 'rails_helper'
require_relative '../../app/services/news_api/news_service'

RSpec.describe NewsApiClient, type: :service do
  describe '#get_news' do
    it 'returns news articles' do
      allow(NewsApiClient).to receive(:get).and_return(fake_news_response)

      news_api = NewsApiClient.new
      articles = news_api.get_news

      expect(articles).to be_an(Array)
      expect(articles).not_to be_empty
    end
  end

  private

  def fake_news_response
    { 'articles' => [{ 'title' => 'Fake Article', 'content' => 'Fake content', 'author' => 'Fake Author' }] }
  end
end
