class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_orders = current_user.orders.includes(:order_items).order('created_at DESC')
    @products = Product.all
  end

  def show
    @user_order = current_user.orders.find_by(params[:order_id])
  end

end
