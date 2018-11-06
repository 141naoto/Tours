class CreateWentPrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :went_prefectures do |t|
      t.integer :went_id
      t.integer :place_id
      t.integer :prefecture_id
      t.string :address
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end
end