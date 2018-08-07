class CreateChills < ActiveRecord::Migration[5.2]
  def change
    create_table :chills do |t|
      t.string :title
      t.integer :capacity
      t.integer :price_per_hour
      t.boolean :available
      t.text :description
      t.text :location
      t.string :type
      t.integer :area
      t.integer :chill_power
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
