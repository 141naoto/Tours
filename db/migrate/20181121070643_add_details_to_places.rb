class AddDetailsToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :place_flag, :boolean, default: false, null: false
  end
end
