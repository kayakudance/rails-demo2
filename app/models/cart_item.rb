class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def calculate_price
    product.price * quantity
  end
end
