class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :user_id, foreign_key: true
      t.integer :follow_id
      t.timestamps
      t.index [:user_id, :follow_id], unique: true
    end
    add_foreign_key :relationships, :users
  end
end
