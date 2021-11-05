class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_user_cart, only: [:index,:update, :destroy, :add_items]
  before_action :setup_this_cart_item!, only: [:add_items]

  def index
    @cart_items = @user_cart.cart_items
    @cart_total = @user_cart.calculate_total_price
  end

  def update
    this_cart_item = @user_cart.cart_items.find_by(product_id: params[:cart_item][:product_id])
    this_cart_item.update!(cart_item_params)
    redirect_to cart_path
  end

  def destroy
    @user_cart.cart_items.destroy(params[:cart_item])
    redirect_to cart_path
  end

  def add_items
    @product = Product.find(params[:id])
    if @this_cart_item.blank?
      @user_cart.cart_items.create(product_id: params[:id], quantity: params[:quantity].to_i)
    else
      @this_cart_item.quantity += params[:quantity].to_i
      @this_cart_item.save
    end

  end

  private
  def setup_user_cart
    if current_user.cart.blank?
      current_user.create_cart
    end
    @user_cart = current_user.cart
  end

  def setup_this_cart_item!
    @this_cart_item = @user_cart.cart_items.find_by(product_id: params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
