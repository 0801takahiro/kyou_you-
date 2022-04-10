class PostImpressionsController < ApplicationController
  def create
    @post_impression = PostImpression.new(post_impression_params)
    @post_impression.user_id = current_user.id
    @post_impression.save
    redirect_to impression_path(@post_impression.impression_id)
  end
  private
  def post_impression_params
    params.require(:post_impression).permit(:user_id, :impression_id, :impression)
  end
end
