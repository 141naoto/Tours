class AddDetailsToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :spot_date, :date
  end
end
