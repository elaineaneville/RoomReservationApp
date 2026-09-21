class CreateReservations < ActiveRecord::Migration[8.1]
  def change
    create_table :reservations do |t|
      t.references :rooms, null: false, foreign_key: true
      t.string :reserver_name
      t.date :reservation_date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
