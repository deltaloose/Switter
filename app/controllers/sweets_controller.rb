class SweetsController < ApplicationController
  #おかし新規登録ページの表示
  def new
    @sweet = Sweet.new
  end
  #おかしの新規作成
  def create
    sweet = current_user.sweets.new(sweet_params)
    #@sweet.user_id = current_user.id
    sweet.save
    redirect_to sweets_path
  end
  #おかし一覧
  def index
    @sweets = Sweet.all
  end
  #おかし詳細
  def show
    @sweet = Sweet.find(params[:id])
    @sweet_comment = SweetComment.new
  end
  #おかし編集表示
  def edit
    @sweet = Sweet.find(params[:id])
  end
  #おかし編集
  def update
    sweet = Sweet.find(params[:id])
    sweet.update(sweet_params)
    redirect_to sweet_path
  end
  #おかし削除
  def destroy
    sweet = Sweet.find(params[:id])
    sweet.destroy
    redirect_to sweets_path
  end
  #おかし投稿時のストロングパラメータ
  private
    def sweet_params
      params.require(:sweet).permit(:name, :opinion, :sweet_image)
    end
end
