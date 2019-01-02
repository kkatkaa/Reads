class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :pages, presence: true, length: { within: 1..1000 }
  validates :date, presence: true
  validates :isbn, presence: true
  validates :language, presence: true

end
