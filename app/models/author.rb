class Author < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :born, presence: true, length: {maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 }

  has_many :authors_books
  has_many :books, through: :authors_books
  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
