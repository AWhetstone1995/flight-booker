class AddBookingIdToPassenger < ActiveRecord::Migration[6.1]
  def change
    add_column :passengers, :passenger_id, :integer
  end
end
