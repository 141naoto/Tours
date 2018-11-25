class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
	# create_table :seasons, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :season

      t.timestamps
    end
  end
end
