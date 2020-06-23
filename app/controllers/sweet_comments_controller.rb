class SweetCommentsController < ApplicationController
#コメント作成メソッド
  def create
    sweet = Sweet.find(params[:sweet_id])
    comment = current_user.sweet_comments.new(sweet_comment_params)
    comment.sweet_id = sweet.id
    comment.save
    comment.sweet_id.create_notification_sweet_comment!(current_user, comment.id)
    redirect_to sweet_path(sweet)
  end
#コメント投稿時のストロングパラメータ
  private
  def sweet_comment_params
    params.require(:sweet_comment).permit(:comment)
  end
end
