require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:user) { create(:user) }
  let(:payment) { create(:payment, author_id: user.id) }
  describe 'Validations' do
    it { should validate_presence_of(:amount) }
    it 'checks if the name is a string' do
      expect(payment.name).to eql('burger')
    end
  end
end
