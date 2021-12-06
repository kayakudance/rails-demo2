class Product < ApplicationRecord
    has_many :cart_items, dependent: :delete_all
    has_many :carts, through: :cart_items
    has_one_attached :image

    validates :name, length: {maximum: 50}, presence: true
    validates :description, length: { maximum: 1000 }
    validates :price, numericality: {greater_than_or_equal_to: 0}

end

