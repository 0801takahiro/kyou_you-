class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.integer :followed_id
      t.integer :follower_id
      t.timestamps
    end
  end
end
