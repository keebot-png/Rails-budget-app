FactoryBot.define do
  factory :category do
    name { 'macdonalds' }
    icon { 'picture-1' }
    id { 2 }
    association :author, factory: :user
  end
end
