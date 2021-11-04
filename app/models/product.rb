class Product < ApplicationRecord
    has_many :cart_items, dependent: :delete_all
    has_many :carts, through: :cart_items
    has_one_attached :image

    validates :name, presence: true
    validates :description, length: { maximum: 512 }
    validates :price, presence: true

end

