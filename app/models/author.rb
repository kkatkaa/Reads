class Author < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :born, presence: true, length: {maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 }
end
