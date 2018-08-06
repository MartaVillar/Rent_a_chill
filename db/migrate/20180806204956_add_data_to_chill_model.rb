class AddDataToChillModel < ActiveRecord::Migration[5.2]
  def change
    add_column :chills, :name, :string
    add_column :chills, :description, :text
    add_column :chills, :location, :text
  end
end
