class OrdersController < ApplicationController
  before_action :set_user_cart, only: [:new, :create]
  before_action :set_user_order, only: [:new]

  def new
    @bill = @user_cart.calculate_total_price
  end

  def create
    @user_order = current_user.orders.create(order_params)

    @user_cart.products.each do |product|
      @order_item = @user_order.order_items.build
      @order_item.product_id = product.id
      @order_item.product_name = product.name
      @order_item.ordered_price = product.price
      @order_item.quantity = product.cart_items.find_by(product_id: product.id).quantity
      @order_item.save
    end

    @user_cart.destroy

    redirect_to completes_order_path
  end

  private
  def set_user_cart
    @user_cart = current_user.cart
    end

  def set_user_order
    @order = current_user.orders.build
  end

  def order_params
    params.require(:order).permit(:zip, :address, :tel, :paymethod, :bill)
  end

end
