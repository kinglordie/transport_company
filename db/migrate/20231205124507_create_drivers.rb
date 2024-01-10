class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :lastname
      t.string :name
      t.string :patronymic
      t.string :dr_license
      t.string :status

      t.timestamps
    end
    add_index :drivers, :dr_license, unique: true
  end
end
