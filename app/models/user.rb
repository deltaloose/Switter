class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sweets, dependent: :destroy
  has_many :sweet_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :user_image
  #バリデーション
  validates :name, presence: true
end
