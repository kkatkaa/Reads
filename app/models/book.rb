class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :pages, presence: true, length: { within: 1..1000 }
  validates :date, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :language, presence: true

  has_many :authors_books
  has_many :authors, through: :authors_books
end
