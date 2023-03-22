FactoryBot.define do
    factory :user do
      name { 'Keenan' }
      sequence(:email) { |n| "#{name.downcase}#{n}@gmail.com" }
      password { 'password' }
    end
  end
  