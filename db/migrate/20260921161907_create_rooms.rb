class CreateRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :rooms do |t|
      t.string :site
      t.string :reference
      t.string :name
      t.string :string
      t.string :capacity
      t.string :integer
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
