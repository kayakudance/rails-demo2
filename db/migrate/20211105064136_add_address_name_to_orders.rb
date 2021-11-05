class AddAddressNameToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :address_name, :string
  end
end
