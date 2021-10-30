class OrdersController < ApplicationController
  before_action :set_user_cart, only: [:new]
  before_action :set_user_order, only: [:new]
  before_action :set_order_item, only: [:new]

  def new

    @bill = @user_cart.calculate_total_price
  end

  def create
    current_user.orders.create(order_params)
  end

  private
  def set_user_cart
    @user_cart = current_user.cart
  end

  def set_user_order
    @user_order = current_user.orders.build
  end

  def set_order_item
    @order_item = @user_order.build_order_item
  end

  def order_params
    params.require(:order).permit(:zip, :address, :tel, :paymethod, :bill)
  end
end
