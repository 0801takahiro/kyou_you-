class ImpressionsController < ApplicationController
  def index
    @new_impression = Impression.new
    @impressions = Impression.all
    @content_list = Content.all
  end
  def show
    @impression = Impression.find(params[:id])
    @post_impressions = @impression.post_impressions
    @post_impression = PostImpression.new
  end
  def create
    @new_impression = Impression.new(impression_params)
    @new_impression.user_id = current_user.id
    content_list = params[:impression][:name].split('　')
    if @new_impression.save
       @new_impression.save_content(content_list)
       redirect_to root_path
    else
       render:index
    end
  end
  def destroy
    @impression = Impression.find(params[:id])
    @impression.destroy
    redirect_to root_path
  end
  private
  def impression_params
    params.require(:impression).permit(:body, :user_id)
  end
end

