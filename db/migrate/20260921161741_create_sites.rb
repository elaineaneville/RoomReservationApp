class CreateSites < ActiveRecord::Migration[8.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :string
      t.string :address
      t.string :string
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
