class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, foreign_key: :user_id
  has_many :authors, foreign_key: :user_id 

  def admin?
     admin
  end
end
