class PostImpression < ApplicationRecord
  belongs_to :user
  belongs_to :impression
  validates :body, presence: true, length: { maximum: 200 }
end
