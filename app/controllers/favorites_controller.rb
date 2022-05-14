class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
    @impressions = @favorite.impressions
  end
  def create
    Favorite.create(user_id: current_user.id,impression_id: params[:id])
    redirect_to root_path
  end
  def destroy
    Favorite.find_by(user_id: current_user.id,impression_id: params[:id]).destroy
    redirect_to root_path
  end
  private
   def favorite_params
     params.require(:favorite).permit(:user_id,:impression_id)
   end
end
