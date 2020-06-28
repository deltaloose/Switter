class Sweet < ApplicationRecord
  belongs_to :user
  has_many :sweet_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  attachment :sweet_image
  #バリデーション
  validates :name, presence: true
  validates :opinion, presence: true, length: { maximum:200 }
  validates :sweet_image, presence: true
end
