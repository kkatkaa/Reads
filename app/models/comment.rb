class Comment < ApplicationRecord
  include ActiveModel::Validations
  validates :body, presence: true, length: {in: 6..1000}
  validates :rating, numericality: true, :inclusion => 1..10
  belongs_to :book
  belongs_to :user
end
