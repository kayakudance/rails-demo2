class ChangeDatatypeZipOfOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :zip, :string
  end
end
