class Comment < ApplicationRecord
  after_save :update_average_ranking
  include ActiveModel::Validations
  validates :body, presence: true, length: {in: 6..1000}
  validates :rating, numericality: true, :inclusion => 1..10
  belongs_to :book
  belongs_to :user

  private
  def update_average_ranking
    book.update_column(:average_ranking, book.average_rating)
  end
end
