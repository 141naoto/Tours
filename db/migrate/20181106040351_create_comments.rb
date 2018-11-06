class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :place_id
      t.integer :season_id
      t.integer :organization_id
      t.string :text
      t.string :title
      t.string :comment_image_id

      t.timestamps
    end
  end
end
