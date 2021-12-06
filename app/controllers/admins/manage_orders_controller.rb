class Admins::ManageOrdersController < ApplicationController
  layout 'admins'

  before_action :authenticate_admin!
  before_action :set_order, only: %i[edit update]

  def index
    @orders = Order.includes(:user).order('created_at desc').page(params[:page])
  end

  def edit
    @order_items = @order.order_items
  end

  def update
    @order.update!(order_params)
    redirect_to admins_manage_orders_path
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_status)
  end
end
