class AddTableIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :table_id, :integer
  end
end
