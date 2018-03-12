class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :date
      t.string :status
      t.text :description
      t.references :user, foreign_key: true
      t.references :offer, foreign_key: true

      t.timestamps
    end
  end
end
