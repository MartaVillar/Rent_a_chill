class RenamingTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :chills, :type, :category
  end
end
