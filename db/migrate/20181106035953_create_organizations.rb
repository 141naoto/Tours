class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :organization

      t.timestamps
    end
  end
end
