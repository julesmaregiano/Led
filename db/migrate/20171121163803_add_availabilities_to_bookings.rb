class AddAvailabilitiesToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :availabilities, foreign_key: true
  end
end
