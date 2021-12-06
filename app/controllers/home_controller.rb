class HomeController < ApplicationController
  def index
    @products = Product.where(is_recommended: true).with_attached_image
  end
end
