class CreateCommentImages < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_images do |t|
	# create_table :comment_images, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :image_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
