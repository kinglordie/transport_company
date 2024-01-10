class CreateCounterparties < ActiveRecord::Migration[7.1]
  def change
    create_table :counterparties do |t|
      t.string :name
      t.string :contact
      t.string :INN
      t.string :email
      t.string :post
      t.string :status

      t.timestamps
    end
  end
end
