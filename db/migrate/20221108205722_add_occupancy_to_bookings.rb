class AddOccupancyToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :occupancy, :integer
  end
end
