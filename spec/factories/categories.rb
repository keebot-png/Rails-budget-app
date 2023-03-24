FactoryBot.define do
  factory :category do
    name { 'macdonalds' }
    icon { Rack::Test::UploadedFile.new('spec/support/clothes.jpg', 'image/jpg') }
    association :author, factory: :user
  end
end
