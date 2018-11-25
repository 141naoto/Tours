class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
	# create_table :likes, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end
  end
end
