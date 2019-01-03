class Comment < ApplicationRecord
  include ActiveModel::Validations
  validates :body, presence: true, length: {in: 6..500}
  belongs_to :book
  belongs_to :user
end
