class SweetsController < ApplicationController
  #未ログイン時、指定ページへ移動不可
  before_action :authenticate_user!, only: [:edit, :create, :new]
  #編集URL直打ち防止
  before_action :correct_user, only: [:edit, :update]
  #おかし新規登録ページの表示
  def new
    @sweet = Sweet.new
  end
  #おかしの新規作成
  def create
    sweet = current_user.sweets.new(sweet_params)
    sweet.user_id = current_user.id
    sweet.save
    redirect_to sweets_path
  end
  #おかし一覧
  def index
    #@sweets = Sweet.all
    #おかし検索(allも含む)
    @q = Sweet.ransack(params[:q])
    @sweets = @q.result(distinct: true)
    #いいねランキング
    @all_ranks = Sweet.find(Favorite.group(:sweet_id).order('count(sweet_id) desc').limit(3).pluck(:sweet_id))
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

  private
    #おかし投稿時のストロングパラメータ
    def sweet_params
      params.require(:sweet).permit(:name, :opinion, :sweet_image)
    end
    #編集URL直打ち防止メソッド
    def correct_user
      @sweet = Sweet.find(params[:id])
      unless @sweet.user.id == current_user.id
        redirect_to sweets_path
      end
    end
end
