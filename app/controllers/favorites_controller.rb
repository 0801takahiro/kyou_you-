class FavoritesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @user = User.find(params[:user_id])
    @favorites = @user.favorites.page(params[:page]).per(5)
  end
  def create
    @impression = Impression.find(params[:id])
    Favorite.create(user_id: current_user.id,impression_id: params[:id])
  end
  def destroy
    @impression = Impression.find(params[:id])
    Favorite.find_by(user_id: current_user.id,impression_id: params[:id]).destroy

  end
  private
   def favorite_params
     params.require(:favorite).permit(:user_id,:impression_id)
   end
end
