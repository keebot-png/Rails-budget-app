class Category < ApplicationRecord
  has_many :payments
  belongs_to :author, class_name: 'User'
  has_one_attached :icon

  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true
end
