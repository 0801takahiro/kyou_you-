class DelModel < ActiveRecord::Migration[5.0]

  def change
    drop_table :tags
    drop_table :tag_relations
  end
end
