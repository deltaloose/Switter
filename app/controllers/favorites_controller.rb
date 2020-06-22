class FavoritesController < ApplicationController
  def create
    sweet = Sweet.find(params[:sweet_id])
    favorite = current_user.favorites.new(sweet_id: sweet.id)
    favorite.save
    redirect_to request.referer
  end
  def destroy
    sweet = Sweet.find(params[:sweet_id])
    favorite = current_user.favorites.find_by(sweet_id: sweet.id)
    favorite.destroy
    redirect_to request.referer
  end
end
