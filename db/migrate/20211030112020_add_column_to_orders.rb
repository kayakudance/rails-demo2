class AddColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :zip, :integer
    add_column :orders, :tel, :integer
  end
end
