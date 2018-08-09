class AddCoordinatesToChills < ActiveRecord::Migration[5.2]
  def change
    add_column :chills, :latitude, :float
    add_column :chills, :longitude, :float
  end
end
