class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_name
      t.string :country_code
      t.integer :zone

      t.timestamps
    end
  end
end
