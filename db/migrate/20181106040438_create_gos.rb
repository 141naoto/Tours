class CreateGos < ActiveRecord::Migration[5.2]
  def change
    create_table :gos do |t|
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end
  end
end
