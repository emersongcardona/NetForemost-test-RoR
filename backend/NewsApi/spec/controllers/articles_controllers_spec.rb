require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    let(:fake_news_response) do 
        { 'articles' => [{ 'title' => 'Fake Article', 'content' => 'Fake content', 'author' => 'Fake Author' }] }
    end
  describe '#index' do
    it 'Calls methods in the right way' do
      allow(NewsApiClient).to receive(:get_news).and_return(fake_news_response)
      allow(Article).to receive(:count).and_return(20)

      get :index

      expect(response).to have_http_status(:success)
      expect(NewsApiClient).to have_received(:count).once
      expect(Article).to have_received(:count).once
    end

    it 'fetches news articles without creating new records if count is 20 or more' do
      allow_any_instance_of(NewsApiClient).to receive(:get_news).and_return(fake_news_response)
      allow(Article).to receive(:count).and_return(20)

      get :index

      expect(response).to have_http_status(:success)
      expect(Article.count).to eq(20) 
    end
  end
end
