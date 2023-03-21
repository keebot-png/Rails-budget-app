class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :categories

  before_validation :set_author

  private

  def set_author
    self.author = User.current_user
  end
end
