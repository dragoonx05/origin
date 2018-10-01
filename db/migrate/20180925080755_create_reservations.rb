class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.date :booking_start
      t.date :booking_end
      t.timestamps
    end
  end
end
