class Category < ApplicationRecord
  has_many :payments
  belongs_to :author, class_name: 'User'

  validates :name, presence: true, length: { maximum: 250 }
  # validates :icon, presence: true
end
