class Sweet < ApplicationRecord
  belongs_to :user
  has_many :sweet_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  attachment :sweet_image
  has_many :notifications, dependent: :destroy
  def create_notification_favorite!(current_user)
    #すでにいいねされているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and sweet_id = ? and action = ? ", current_user.id, user_id, id, 'favorite'])
    #いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        sweet_id: id,
        visited_id: user_id,
        action: 'favorite'
      )
    #自分の投稿に関するいいねの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  def create_notification_sweet_comment!(current_user)
    #自分以外にコメントしている人を全て取得し、全員に通知を送る
    temp_ids = Sweet_comment.select(:user_id).where(sweet_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_sweet_comment!(current_user, sweet_comment_id, temp_id['user_id'])
    end
    #まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_sweet_comment!(current_user, sweet_comment_id, user_id) if temp_ids.blank?
  end
  def save_notification_comment!(current_user, sweet_comment_id, visited_id)
    #コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      sweet_id: id,
      sweet_comment_id: sweet_comment_id,
      visited_id: visited_id,
      action: 'sweet_comment'
      )
    #自分の投稿に関するコメントは通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
    end
  end
end
