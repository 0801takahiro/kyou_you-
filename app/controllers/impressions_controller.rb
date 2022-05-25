class ImpressionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search_content]
  def index
    @new_impression = Impression.new
    @impressions = Impression.page(params[:page]).per(5)
    @content_list = Content.all
    @content = Content.all
  end
  def show
    @new_impression = Impression.new
    @impression = Impression.find(params[:id])
    @impression_contents = @impression.contents
    @post_impressions = @impression.post_impressions.page(params[:page]).per(5)
    @post_impression = PostImpression.new
    @content = Content.all
  end
  def search_content
    @content_list = Content.all
    @content = Content.find(params[:content_id])
    @impressions = @content.impressions
  end
  def create
    @new_impression = Impression.new(impression_params)
    @new_impression.user_id = current_user.id
    content_list = params[:impression][:name].split('　')
    if @new_impression.save
       @new_impression.save_content(content_list)
       flash[:success] = '投稿が完了しました'
       redirect_to root_path
    else
       flash[:alert] = '投稿が失敗しました'
       redirect_back fallback_location: root_path
    end
  end
  def destroy
    @impression = Impression.find(params[:id])
    @impression.destroy
    flash[:success] = '投稿を削除しました'
    redirect_back fallback_location: root_path
  end
  private
  def impression_params
    params.require(:impression).permit(:body, :user_id)
  end
end

