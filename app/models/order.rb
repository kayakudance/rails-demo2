class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  def status_options
    ["注文受付", "支払い待ち", "発送準備", "発送完了"]
  end
end
