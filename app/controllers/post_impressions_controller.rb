class PostImpressionsController < ApplicationController
  def create
    @post_impression = PostImpression.new(post_impression_params)
    @impression = Impression.find(params[:impression_id])
    @post_impression.impression_id = @impression.id
    @post_impression.user_id = current_user.id
    @post_impression.save
    redirect_to impression_path(@post_impression.impression_id)
  end
  def destroy
    @post_impression = PostImpression.find_by(id: params[:id])
    @post_impression.destroy
    redirect_back fallback_location: @post
  end
  private
  def post_impression_params
    params.require(:post_impression).permit(:body)
  end
end
