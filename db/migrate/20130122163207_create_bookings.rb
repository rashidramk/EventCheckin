class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :guests
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.integer :restaurant_id
      t.text :notes

      t.timestamps
    end
  end
end
