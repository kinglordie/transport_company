class CreateSalaries < ActiveRecord::Migration[7.1]
  def change
    create_table :salaries do |t|
      t.references :driver, null: false, foreign_key: true
      t.date :salary_date
      t.decimal :km_rate
      t.decimal :reis
      t.decimal :travel_allow
      t.decimal :downtime
      t.decimal :premium

      t.timestamps
    end
  end
end
