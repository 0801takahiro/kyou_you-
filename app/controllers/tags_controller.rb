class TagsController < ApplicationController
  def index
    @tags = ActASTaggableOn::Tag.all
  end
  def show
    @tag = ActASTaggableOn::Tag.find(params[:id])
    @impressions = Impression.tagged_with(@tag.name)
  end
end
