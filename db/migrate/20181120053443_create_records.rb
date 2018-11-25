class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
	# create_table :records, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :record_title
      t.string :record_text
      t.integer :user_id

      t.timestamps
    end
  end
end
