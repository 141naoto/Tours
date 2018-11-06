class CreateWents < ActiveRecord::Migration[5.2]
  def change
    create_table :wents do |t|
      t.integer :user_id
      t.integer :place_id
      t.integer :prefecture_count

      t.timestamps
    end
  end
end
