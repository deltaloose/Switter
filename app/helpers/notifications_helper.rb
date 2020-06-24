module NotificationsHelper
  def notification_form(notification)
    @visiter = notification.visiter
    #@comment sweet = nil
    your_ = link_to 'あなたの投稿', users_sweet_path(notification), style:"font-weight: bold;"
    @visiter_comment = notification.comment_id
    #notification.actionがfollowかlikeかcommentか
    case notification.action
      when "follow" then
        tag.a(notification.visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
      when "like" then
        tag.a(notification.visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_sweet_path(notification.sweet_id), style:"font-weight: bold;")+"にいいねしました"
      when "comment" then
          @comment = Comment.find_by(id: @visiter_comment)&.content
          tag.a(@visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_sweet_path(notification.sweet_id), style:"font-weight: bold;")+"にコメントしました"
    end
  end
end
