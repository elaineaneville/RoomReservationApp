class AddUserAndStatusToReservations < ActiveRecord::Migration[8.1]
  def change
    add_reference :reservations, :user, foreign_key: true
    add_column :reservations, :status, :integer, null: false, default: 0
  end
end