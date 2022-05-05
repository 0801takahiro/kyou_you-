class Impression < ApplicationRecord
  acts_as_taggable

  belongs_to :user
  has_many :post_impressions
  has_many :favorites

  def self.looks(search, word)
    if search == "perfect_match"
      @impression = Impression.where("body LIKE?","#{word}")
    elsif search == "partial_match"
      @impression = Impression.where("body LIKE?","%#{word}%")
    else
      @impression = Impression.all
    end
  end
end
