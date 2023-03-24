require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category, author_id: user.id) }
  before(:example) { login_as user }

  describe 'GET /index' do
    before(:example) do
      get('/categories')
      @response_body = response.body
    end

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index ' do
      expect(response).to render_template(:index)
    end

    it 'body should have Add a new category button' do
      expect(@response_body).to include 'Add a new category'
    end
  end

  describe 'GET /show' do
    before(:example) do
      get("/categories/#{category.id}")
      @response_body = response.body
    end

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index ' do
      expect(response).to render_template(:show)
    end

    it 'body should have Add a new category button' do
      expect(@response_body).to include 'Add New Payment'
    end
  end

  describe 'GET /new' do
    before(:example) do
      get('/categories/new')
      @response_body = response.body
    end

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index ' do
      expect(response).to render_template(:new)
    end

    it 'body should have Add a new category button' do
      expect(@response_body).to include 'Create a new category'
    end
  end
end
