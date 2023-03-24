require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category, author_id: user.id) }
  let(:payment) { create(:payment, author_id: user.id) }
  before(:example) { login_as user }

  describe 'GET /new' do
    before(:example) do
      get("/categories/#{category.id}/payments/new")
      @response_body = response.body
    end

    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index ' do
      expect(response).to render_template(:new)
    end

    it 'body should have Add a new category button' do
      expect(@response_body).to include 'Create Payment'
    end
  end
end
