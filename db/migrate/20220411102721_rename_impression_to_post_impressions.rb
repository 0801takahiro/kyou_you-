class RenameImpressionToPostImpressions < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_impressions, :impression, :body
  end
end
