class HomeController < ApplicationController
  def index
    @products = Product.where(recommended_flag: true)
  end
end
