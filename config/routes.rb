Rails.application.routes.draw do
  root 'home#index'

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  namespace :admins do
    root 'manage_products#index'
    resources :manage_products
    resources :manage_orders, only:[:index, :edit, :update]
  end


  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
  }

  devise_scope :user do
    get 'after_signup_confirmation', to: 'users/registrations#after_signup_confirmation'
  end

  resources :products, only:[:index, :show]

  scope :aftermails do
    get 'aftersignupmail', to:'aftermails#signup'
  end

  get 'cart', to: 'carts#index'
  patch 'cart', to: 'carts#update', as: 'update_cart_item_quantity'
  delete 'cart', to: 'carts#destroy', as: 'destroy_cart_item'
  post 'cart/added', to: 'carts#add_items'

  #  レジ
  resources :orders, only: [:new, :create]
  post 'orders/confirm', to: 'orders#confirm', as: 'orders_confirm'
  get 'orders/complete', to: 'orders#complete', as: 'orders_complete'

  # 注文履歴
  resources :histories, only: [:index, :show]

end
