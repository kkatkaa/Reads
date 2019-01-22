class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  has_many :books, foreign_key: :user_id
  has_many :authors, foreign_key: :user_id
  has_many :favorites
  has_many :favorited_books, through: :favorites, source: :book

  def admin?
     admin
  end
end
