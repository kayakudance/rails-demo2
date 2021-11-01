class Product < ApplicationRecord
    has_many :cart_items, dependent: :delete_all
    has_many :carts, through: :cart_items
end

