require 'rails_helper'

RSpec.describe 'Payments', type: :request do
    let(:user) { create(:user) }
    before(:example) { login_as user }

  describe 'GET /new' do
    before(:example) { get('/general_shopping_list') }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index ' do
      expect(response).to render_template(:index)
    end
    it 'body should have shopping list text' do
      expect(response.body).to include 'Shopping List'
    end
  end
end