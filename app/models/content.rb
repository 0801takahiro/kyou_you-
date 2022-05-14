class Content < ApplicationRecord
  has_many :content_relations, dependent: :destroy
  has_many :impressions,through: :content_relations
  validates :name, uniqueness: true, presence: true

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
  def self.looks(search, word)
    if search == "perfect_match"
      @content = Content.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @content = Content.where("name LIKE?","%#{word}%")
    else
      @content = Content.all
    end
  end
end
