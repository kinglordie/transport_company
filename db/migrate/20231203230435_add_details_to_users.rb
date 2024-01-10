class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :lastname, :string
    add_column :users, :name, :string
    add_column :users, :patronymic, :string
    add_column :users, :role, :string
  end
end
