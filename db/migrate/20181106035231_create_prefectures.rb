class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
	# create_table :prefectures, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :region_id
      t.string :prefecture

      t.timestamps
    end
  end
end
