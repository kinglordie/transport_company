class AddTypeToFuels < ActiveRecord::Migration[7.1]
  def change
    add_column :fuels, :type_f, :string
  end
end
