class Comment < ApplicationRecord
  after_save :update_rating_average
  include ActiveModel::Validations
  validates :body, presence: true, length: {in: 6..1000}
  validates :rating, numericality: true, :inclusion => 1..10
  belongs_to :book
  belongs_to :user

  private
  def update_rating_average
    book.update_column(:rating_average, book.average_rating)
  end
end
