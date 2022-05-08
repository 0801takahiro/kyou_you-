class Impression < ApplicationRecord
  has_many :content_relations, dependent: :destroy
  has_many :contents, through: :content_relations
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
  def save_content(sent_contents)
    current_contents = self.contents.pluck(:name) unless self.contents.nil?
    old_contents = current_contents - sent_contents
    new_contents = sent_contents - current_contents
    old_contents.each do |old|
      self.contents.delete Content.find_by(name: old)
    end
    new_contents.each do |new|
      new_impression_content = Content.find_or_create_by(name: new)
      self.contents << new_impression_content
    end
  end
end
