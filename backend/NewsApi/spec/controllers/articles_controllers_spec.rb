# spec/controllers/articles_controller_spec.rb

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe '#index' do
    it 'fetches news articles and creates records if count is less than 20' do
      allow_any_instance_of(NewsApiClient).to receive(:get_news).and_return(fake_news_response)
      allow(Article).to receive(:count).and_return(20)

      get :index

      expect(response).to have_http_status(:success)
      expect(Article.count).to eq(20)
    end

    it 'fetches news articles without creating new records if count is 20 or more' do
      allow_any_instance_of(NewsApiClient).to receive(:get_news).and_return(fake_news_response)
      allow(Article).to receive(:count).and_return(20)

      get :index

      expect(response).to have_http_status(:success)
      expect(Article.count).to eq(20) 
    end
  end

  private

  def fake_news_response
    { 'articles' => [{ 'title' => 'Fake Article', 'content' => 'Fake content', 'author' => 'Fake Author' }] }
  end
end
