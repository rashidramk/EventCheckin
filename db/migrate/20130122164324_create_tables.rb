class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :covers
      t.integer :table_no
      t.string :table_name
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
