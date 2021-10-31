class OrderItem < ApplicationRecord
  belongs_to :order

  def calculate_total
    quantity * ordered_price
  end
end
