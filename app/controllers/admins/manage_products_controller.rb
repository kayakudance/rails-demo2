class Admins::ManageProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: %i[edit update destroy]

  layout 'admins'

  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.news
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_manage_products_path, notice: "商品を１件登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admins_manage_products_path, notice: "商品情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy!
    redirect_to admins_manage_products_path, notice: "商品を１件削除しました"
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :is_recommended)
  end
end
