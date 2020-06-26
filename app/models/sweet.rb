class Sweet < ApplicationRecord
  belongs_to :user
  has_many :sweet_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  attachment :sweet_image
  #acts_as_taggable #タグのエイリアス
end
