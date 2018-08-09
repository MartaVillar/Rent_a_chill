class RemoveChillPowerFromChills < ActiveRecord::Migration[5.2]
  def change
    remove_column :chills, :chill_power, :integer
  end
end
