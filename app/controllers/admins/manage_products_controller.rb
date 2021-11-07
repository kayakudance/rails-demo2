class Admins::ManageProductsController < ApplicationController
  before_action :authenticate_admin!

  layout 'admins'
  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "商品を１件登録しました。"
      redirect_to admins_manage_products_path
    else
      render action: :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    flash[:success] = "商品を更新しました。"
    redirect_to admins_manage_products_path
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:success] = "商品を１件削除しました。"
    redirect_to admins_manage_products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :recommended_flag)
  end
end
