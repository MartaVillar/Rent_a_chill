class RemoveAreaFromChills < ActiveRecord::Migration[5.2]
  def change
    remove_column :chills, :area, :integer
  end
end
