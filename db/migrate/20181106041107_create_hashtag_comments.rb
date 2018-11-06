class CreateHashtagComments < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtag_comments do |t|
      t.integer :hashtag_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
