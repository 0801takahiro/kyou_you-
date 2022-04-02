class CreateImpressions < ActiveRecord::Migration[5.0]
  def change
    create_table :impressions do |t|
      t.text :impression
      t.timestamps
    end
  end
end
