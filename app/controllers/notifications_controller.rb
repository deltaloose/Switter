class NotificationsController < ApplicationController
  def index
    #current_userの投稿に紐づいた通知一覧
    @notifiation = current_user.passive_notifications
    #@notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ
    @notifiation.where(checked: false).each do |notifiation|
      notifiation.update_attributes(checked: true)
    end
  end
  def destroy_all
    #通知を全削除
    @notifiations = current_user.passive_notifications.destroy_all
    redirect_to users_notifications_path
  end
end