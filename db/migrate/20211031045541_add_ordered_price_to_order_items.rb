class AddOrderedPriceToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :ordered_price, :integer
  end
end
