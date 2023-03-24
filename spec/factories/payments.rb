FactoryBot.define do
    factory :payment do
      name { 'burger' }
      amount { 1000 }
      association :author, factory: :user
    end
  end