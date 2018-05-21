class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :pet, foreign_key: true
      t.references :user, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
