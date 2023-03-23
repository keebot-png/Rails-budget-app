class Category < ApplicationRecord
  # has_and_belongs_to_many :payments
  has_many :payments
  belongs_to :author, class_name: 'User'
end
