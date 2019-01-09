class Book < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :pages, presence: true, length: { within: 1..1000 }
  validates :date, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :language, presence: true

  has_many :authors_books
  has_many :authors, through: :authors_books
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def tags=(value)
    value = sanitize_tags(value) if value.is_a?(String)

    super(value)
  end

  def avg_rating
    self.comments.average(:rating)
  end

  private

  def sanitize_tags(text)
    text.downcase.split.uniq
  end
end
