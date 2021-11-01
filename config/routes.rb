Rails.application.routes.draw do
  devise_for :admins, controllers: {
    registrations: 'admins/auth/registrations',
    sessions: 'admins/auth/sessions',
    passwords: 'admins/auth/passwords',
    confirmations: 'admins/auth/confirmations',
    unlocks: 'admins/auth/unlocks'
  }

  namespace :admins do
    root 'admin#index'
    resources :manage_products
    resources :manage_orders, only:[:index, :edit, :update]
  end

  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  resources :products, only:[:index, :show]

  scope :aftermails do
    get 'aftersignupmail', to:'aftermails#signup'
    get 'aftersignin', to:'aftermails#signin'
  end

  get 'cart', to: 'carts#index'
  patch 'cart', to: 'carts#update', as: 'update_cart_item_quantity'
  delete 'cart', to: 'carts#destroy', as: 'destroy_cart_item'
  post 'cart/added', to: 'carts#add_items'

  #  レジ
  resources :orders, only: [:new, :create]

  #　complete
  namespace :completes do
    get 'order'
  end

  # 注文履歴
  resources :histories, only: [:index, :show]

end
