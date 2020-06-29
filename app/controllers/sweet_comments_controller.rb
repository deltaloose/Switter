class SweetCommentsController < ApplicationController
#コメント作成メソッド
  def create
    @sweet = Sweet.find(params[:sweet_id])
    @sweet_comment = SweetComment.new
    @q = Sweet.ransack(params[:q])
    @sweets = @q.result(distinct: true)
    @comment = current_user.sweet_comments.new(sweet_comment_params)
    @comment.sweet_id = @sweet.id
    if @comment.save
      redirect_to sweet_path(@sweet)
    else
      render 'sweets/show'
    end
  end
#コメント投稿時のストロングパラメータ
  private
  def sweet_comment_params
    params.require(:sweet_comment).permit(:comment)
  end
end
