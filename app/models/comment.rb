class Comment < ApplicationRecord
  validates :body, presence: true, length: {in: 6..500}
  belongs_to :book
  belongs_to :user 
end
