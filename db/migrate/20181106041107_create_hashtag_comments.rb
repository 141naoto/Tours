class CreateHashtagComments < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_comments do |t|
	# create_table :hashtag_comments, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :hashtag_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
