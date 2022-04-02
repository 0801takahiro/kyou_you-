class CreatePostImpressions < ActiveRecord::Migration[5.0]
  def change
    create_table :post_impressions do |t|
      t.string :user_id
      t.string :impression_id
      t.text :impression
      t.timestamps
    end
  end
end
