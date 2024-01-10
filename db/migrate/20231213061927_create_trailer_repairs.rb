class CreateTrailerRepairs < ActiveRecord::Migration[7.1]
  def change
    create_table :trailer_repairs do |t|
      t.integer :trailer_id
      t.date :date_repair
      t.string :part_name
      t.decimal :price

      t.timestamps
    end
    add_index :trailer_repairs, :trailer_id
    add_foreign_key :trailer_repairs, :trailers
  end
end
