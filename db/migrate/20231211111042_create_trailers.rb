class CreateTrailers < ActiveRecord::Migration[7.1]
  def change
    create_table :trailers do |t|
      t.string :car_number
      t.string :model
      t.string :trailer_type
      t.integer :year
      t.string :VIN
      t.string :STS
      t.string :status

      t.timestamps
    end
  end
end
