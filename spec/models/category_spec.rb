require 'rails_helper'

RSpec.describe Category, type: :model do
    let(:user) { create(:user) }
    let(:category) { create(:category, author_id: user.id) }
    
    describe 'Validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:icon) }
    end
end