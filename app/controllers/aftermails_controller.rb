class AftermailsController < ApplicationController
  def signup
  end

  def signin
    unless current_user.cart
      current_user.create_cart
    end
  end
end
