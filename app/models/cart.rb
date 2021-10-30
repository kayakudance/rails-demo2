class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :products, through: :cart_items

  def calculate_total_price
    # byebug
    cart_total_price = 0
    cart_items.each do |cart_item|
      cart_total_price += cart_item.calculate_price
    end
    cart_total_price
  end

end
