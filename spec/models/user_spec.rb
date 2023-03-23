require 'rails_helper'

RSpec.describe User, type: :model do
    before :each do
        @user = FactoryBot.create(:user)
    end

    describe 'Validations' do
        it 'should be valid' do
            expect(@user).to be_valid
        end

        it "is invalid without an email" do
            @user.email = nil
            expect(@user).not_to be_valid
          end

        it 'should not have a blank name' do
            @user.name = nil
            expect(@user).to_not be_valid
        end
    end
end