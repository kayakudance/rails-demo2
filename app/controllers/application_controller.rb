class ApplicationController < ActionController::Base
  before_action :store_current_location, unless: :devise_controller?

  # どのビューやコントローラーでも呼び出せるメソッドとして定義する
  helper_method :current_cart

  private

  def store_current_location
    store_location_for(:user, request.url)
  end
end
