class Category < ApplicationRecord
  has_many :payments
  belongs_to :author, class_name: 'User'
end
