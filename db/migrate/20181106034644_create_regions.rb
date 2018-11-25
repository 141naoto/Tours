class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
	# create_table :regions, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :region_name

      t.timestamps
    end
  end
end
