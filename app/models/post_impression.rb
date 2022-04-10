class PostImpression < ApplicationRecord
  belongs_to :user
  belongs_to :impression
end
