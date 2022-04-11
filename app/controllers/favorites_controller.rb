class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id,impression_id: params[:id])
    redirect_to root_path
  end
  def destroy
    Favorite.find_by(user_id: current_user.id,impression_id: params[:id]).destroy
    redirect_to root_path
  end
end
