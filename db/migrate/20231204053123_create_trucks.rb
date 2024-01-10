class CreateTrucks < ActiveRecord::Migration[7.1]
  def change
    create_table :trucks do |t|
      t.string :car_number
      t.string :model
      t.integer :year
      t.string :VIN
      t.string :STS
      t.string :status

      t.timestamps
    end
  end
end
