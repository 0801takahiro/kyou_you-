class TagsController < ApplicationController
  def index
    @tags = ActsASTaggableOn::Tag.all
  end
  def show
    @tag = ActsASTaggableOn::Tag.find(params[:id])
    @impressions = Impression.tagged_with(@tag.name)
  end
end
