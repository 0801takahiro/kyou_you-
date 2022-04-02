class CreateTagRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_relations do |t|
      t.integer :tag_id
      t.integer :impression_id
      t.timestamps
    end
  end
end
