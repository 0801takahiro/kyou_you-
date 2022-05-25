class PostImpressionsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post_impression = PostImpression.new(post_impression_params)
    @impression = Impression.find(params[:impression_id])
    @post_impression.impression_id = @impression.id
    @post_impression.user_id = current_user.id
    if @post_impression.save
       flash[:success] = '投稿が完了しました'
       redirect_to impression_path(@post_impression.impression_id)
    else
       flash[:alert] = '投稿が失敗しました'
       redirect_back fallback_location: impression_path(@post_impression.impression_id)
    end
  end
  def destroy
    @post_impression = PostImpression.find_by(id: params[:id])
    @post_impression.destroy
    redirect_back fallback_location: root_path
  end
  private
  def post_impression_params
    params.require(:post_impression).permit(:body)
  end
end
