class OrderForm
  include ActiveModel::Model

  attr_accessor :user_id, :address, :paymethod, :bill, :zip, :tel, :product_id, :product_name, :quantity

  def save
    user_order = User.find(user_id).orders
    user_order.create(address: address, paymethod: paymethod, bill: bill, zip: zip, tel: tel)
  end
end