class ContentRelation < ApplicationRecord
 belongs_to :impression
 belongs_to :content
 validates :impression_id, presence: true
 validates :content_id, presence: true
end
