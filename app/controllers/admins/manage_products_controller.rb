class Admins::ManageProductsController < ApplicationController
  layout 'admins'
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    redirect_to admins_manage_products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find_by(params[:id])
    @product.update(product_params)
    redirect_to admins_manage_products_path
  end

  def destroy
    product = Product.find_by(params[:id])
    product.destroy

    redirect_to admins_manage_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
