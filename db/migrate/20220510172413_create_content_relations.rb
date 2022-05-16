class CreateContentRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :content_relations do |t|
      t.integer :impression_id, foreign_key: true
      t.integer :content_id, foreign_key: true

      t.timestamps
    end
    add_index :content_relations, [:impression_id, :content_id], unique: true
  end
end
