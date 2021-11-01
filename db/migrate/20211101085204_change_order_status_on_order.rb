class ChangeOrderStatusOnOrder < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :order_status, :string, default: "注文受付"
  end
end
