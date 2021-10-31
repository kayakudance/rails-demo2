class ChangeDatatypeTelOfOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :tel, :string
  end
end
