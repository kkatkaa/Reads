class Favorite < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :user, uniqueness: {scope: :book, message: 'already liked'}
end
