class AddDefaultVaalueToStatusInBookings < ActiveRecord::Migration[5.1]
  def change
    change_column :bookings, :status, :string, default: "<pend></pend>ing"
  end
end
