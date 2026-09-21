class CreateRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :rooms do |t|
      t.references :sites, null: false, foreign_key: true
      t.string :name
      t.integer :capacity
      t.string :description

      t.timestamps
    end
  end
end
