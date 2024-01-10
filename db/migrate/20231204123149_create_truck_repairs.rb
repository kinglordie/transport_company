class CreateTruckRepairs < ActiveRecord::Migration[7.1]
  def change
    create_table :truck_repairs do |t|
      t.integer :truck_id
      t.date :date_repair
      t.string :part_name
      t.decimal :price

      t.timestamps
    end
    add_index :truck_repairs, :truck_id
    add_foreign_key :truck_repairs, :trucks
  end
  

end
