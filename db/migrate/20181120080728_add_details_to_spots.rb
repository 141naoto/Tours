class AddDetailsToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :prefecture_id, :integer
  end
end
