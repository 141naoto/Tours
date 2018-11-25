class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
  # create_table :spots, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :record_id
      t.string :spot_image_id
      t.string :spot_name
      t.string :spot_title
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
