class Product < ApplicationRecord
    has_many :cart_items, dependent: :delete_all
    has_many :carts, through: :cart_items
    has_one_attached :image

    validates :name, presence: true
    validates :description, length: { maximum: 512 }
    validates :price, presence: true

    def recommended_flag_to_mark
        if recommended_flag
            "&#128310;"
        else
            ""
        end
    end

end

