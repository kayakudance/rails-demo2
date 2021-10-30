class CartsController < ApplicationController
  before_action :setup_user_cart, only: [:add_items]
  before_action :setup_cart_item!, only: [:add_items]

  def index
  end

  def add_items
    if @cart_items.blank?
      @user_cart.cart_items.create(product_id: params[:id], quantity: params[:quantity].to_i)
    else
      @cart_items.quantity += params[:quantity].to_i
    end
  end

  private
  def setup_user_cart
    @user_cart = current_user.cart
  end
  def setup_cart_item!
    @cart_items = @user_cart.cart_items.find_by(product_id: params[:id])
  end
end
