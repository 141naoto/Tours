class CreateCommentsHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :comments_hashtags do |t|
	# create_table :comments_hashtags, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :comment_id
      t.integer :hashtag_id

      t.timestamps
    end
  end
end
