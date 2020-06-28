class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @q = Sweet.ransack(params[:q])
    @sweets = @q.result(distinct: true)
  end
  def edit
    if
      @user = current_user
    else
       render :show
    end
    @q = Sweet.ransack(params[:q])
    @sweets = @q.result(distinct: true)
  end
  def update
    user = current_user
    if user.update(user_params)
       redirect_to user_path(user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
  end
end
