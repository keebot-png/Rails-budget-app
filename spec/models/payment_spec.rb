require 'rails_helper'

RSpec.describe Payment, type: :model do
    before :each do
        @user = FactoryBot.build(:user)
        @payment = FactoryBot.build(:payment, author_id: @user.id)
    end
        describe 'Validations' do
            it 'checks if the name is burger and is valid' do
                expect(@payment.name).to eql('burger')
                expect(@payment.name).to be_valid
            end
        end
end