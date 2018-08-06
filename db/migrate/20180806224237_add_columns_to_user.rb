class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :description, :text
    add_column :users, :phone, :string
  end
end
