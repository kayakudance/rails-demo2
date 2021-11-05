class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :address_name, presence: true, length: { maximum: 30 }
  validates :zip, presence: true, length: { maximum: 7 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :tel, presence: true

  def status_options
    ["注文受付", "支払い待ち", "発送準備", "発送完了"]
  end
end
