class UsersController < ApplicationController
  def index
   @users = User.all
  end
  def show
   @user = User.find(params[:id])
   @favorites = current_user.favorites
   @impressions = @user.impressions
   @contents = Content.all
  end
  def edit
   @user = User.find_by(id: current_user)
  end
  def update
   @user = User.find_by(id: current_user)
   if @user.update(user_params)
      redirect_to user_path
   else
      render :show
   end
  end
  private
   def user_params
    params.require(:user).permit(:name, :introduction, :email, :image)
   end
end
