class RenameTitleColumnToImpressions < ActiveRecord::Migration[5.2]
  def change
    rename_column :impressions, :impression, :body
  end
end
