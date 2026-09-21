class CreateReservations < ActiveRecord::Migration[8.1]
  def change
    create_table :reservations do |t|
      t.string :room
      t.string :reference
      t.string :reserver_name
      t.string :string
      t.string :reservation_date
      t.string :date
      t.string :start_time
      t.string :time
      t.string :end_time
      t.string :time

      t.timestamps
    end
  end
end
