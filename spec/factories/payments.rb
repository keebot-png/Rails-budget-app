FactoryBot.define do
    factory :payment do
      name { 'burger' }
      amount { 1000 }
      author_id { 1 }
    end
  end