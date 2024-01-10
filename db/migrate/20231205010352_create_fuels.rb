class CreateFuels < ActiveRecord::Migration[7.1]
  def change
    create_table :fuels do |t|
      t.date :date
      t.integer :truck_id
      t.decimal :fuel_l
      t.decimal :price

      t.timestamps
    end
    add_index :fuels, :truck_id
    add_foreign_key :fuels, :trucks

  end
end
