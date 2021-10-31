class HistoriesController < ApplicationController
  def index
    @user_orders = current_user.orders
  end

  def show
    @user_order = current_user.orders.find_by(params[:order_id])
  end

end
