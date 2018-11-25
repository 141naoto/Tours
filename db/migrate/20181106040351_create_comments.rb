class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
  # create_table :comments, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :user_id
      t.integer :place_id
      t.string :season
      t.string :organization
      t.string :text
      t.string :title

      t.timestamps
    end
  end
end
