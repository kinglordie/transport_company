class CreateReisTable < ActiveRecord::Migration[7.1]
  def change
    create_table :reis_tables do |t|
      t.references :counterparty, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.references :truck, null: false, foreign_key: true
      t.references :trailer, null: false, foreign_key: true
      t.string :loading
      t.string :unloading
      t.date :date_load
      t.date :date_unload
      t.string :cargo_name
      t.decimal :km
      t.decimal :rate
      t.decimal :tonnage
      t.boolean :nds
      t.decimal :sum
      t.date :due_date
      t.date :invoice_date
      t.date :letter_date
      t.date :deadline
      t.string :status
      t.string :tracking_number

      t.timestamps
    end
  end
end
