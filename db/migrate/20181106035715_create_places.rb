class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :prefecture_id
      t.string :place_name
      t.string :place_image_id
      t.string :place_introduction
      t.integer :show_count
      t.string :hours
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
