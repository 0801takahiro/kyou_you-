class UsersController < ApplicationController
  def index
   @users = User.all
  end
  def show
   @user = User.find(params[:id])
   @impressions = @user.impressions.page(params[:page]).per(5)
   @contents = Content.all
  end
  def follow_list
   @user = User.find(params[:user_id])
   @relationships = @user.relationships.page(params[:page]).per(10)
  end
  def follower_list
   @user = User.find(params[:user_id])
   @follower = @user.reverse_of_relationships.page(params[:page]).per(5)
  end
  def edit
   @user = User.find_by(id: current_user)
  end
  def update
   @user = User.find_by(id: current_user)
   if @user.update(user_params)
      flash[:success] = 'ユーザーデータを変更しました'
      redirect_to user_path(@user)
   else
      flash.now[:alert] = 'ユーザーデータの変更が失敗しました'
      render :edit
   end
  end
  def destroy
   @user = User.find_by(id: current_user)
   @user.destroy
   redirect_to root_path
  end
  private
   def user_params
    params.require(:user).permit(:name, :introduction, :email, :image)
   end
end
