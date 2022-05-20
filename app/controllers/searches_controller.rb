class SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "Impression"
      @impressions = Impression.looks(params[:search], params[:word])
    elsif @range == "Content"
      @content = Content.looks(params[:search], params[:word])
    end
  end
end
