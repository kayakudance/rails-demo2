class Admins::ManageOrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def edit
    @order = Order.find(params[:id])
    @order_user = @order.user
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admins_manage_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
