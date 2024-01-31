require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
    let(:fake_news_response) do 
        { 'articles' => [{'id' => 1, 'title' => 'Fake Article', 'content' => 'Fake content', 'author' => 'Fake Author' }] }
    end
  describe '#index' do
    it 'creates 20 new articles if the count is 0' do
        Article.destroy_all
        get :index
        expect(Article.count).to eq(20)
      end

    it 'get articles fron index' do
      get :index
      expect(response).to have_http_status(:success)
      response_data = JSON.parse(response.body)
    end
    end

    describe '#show' do
        it 'returns JSON of a specific article by ID' do
          article = create(:article, id: 123, title: 'Test Article', content: 'Test content', author: 'Test Author')
          get :show, params: { id: article.id }
          expect(response).to have_http_status(:success)
          response_data = JSON.parse(response.body)
          expect(response_data['id']).to eq(article.id)
        end
    end
end
