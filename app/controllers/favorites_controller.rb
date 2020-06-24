class FavoritesController < ApplicationController
  def create
    @sweet = Sweet.find(params[:sweet_id])
    favorite = current_user.favorites.new(sweet_id: @sweet.id)
    favorite.save
    @sweet.create_notification_by(current_user)
    redirect_to request.referer
  end
  def destroy
    sweet = Sweet.find(params[:sweet_id])
    favorite = current_user.favorites.find_by(sweet_id: sweet.id)
    favorite.destroy
    redirect_to request.referer
  end
end
