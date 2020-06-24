class SweetCommentsController < ApplicationController
#コメント作成メソッド
  def create
    @sweet = Sweet.find(params[:sweet_id])
    #@comment = current_user.sweet_comments.new(sweet_comment_params)
    #@comment.sweet_id = @sweet.id
    @comment = @sweet.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment_sweet = @comment.sweet
    if @comment.save
      #通知の作成
      @comment.create_notification_comment!(current_user, @comment.id)
      redirect_to sweet_path(sweet)
    end
  end
#コメント投稿時のストロングパラメータ
  private
  def sweet_comment_params
    params.require(:sweet_comment).permit(:comment)
  end
end
