class AddPhotoToChill < ActiveRecord::Migration[5.2]
  def change
    add_column :chills, :photo, :string
  end
end
