class Impression < ApplicationRecord
  acts_as_taggable

  belongs_to :user
  has_many :post_impressions
end
