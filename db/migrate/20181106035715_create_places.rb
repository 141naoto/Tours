class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
  # create_table :places, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :prefecture_id
      t.string :place_name
      t.string :place_image_id
      t.string :place_introduction
      t.integer :show_count
      t.string :hours
      t.boolean :place_flag, default: false, null: false
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
