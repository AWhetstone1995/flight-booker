class RemovePassengerIdAndAddBookingIdToPassenger < ActiveRecord::Migration[6.1]
  def change
    remove_column :passengers, :passenger_id
    add_column :passengers, :booking_id, :integer
  end
end
