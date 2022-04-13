class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.integer :followed_id, foreign_key: {to_table: :users}
      t.integer :follower_id, foreign_key: {to_table: :users}
      t.timestamps
      t.index [:follower_id, :followed_id], unique: true
    end
  end
end
