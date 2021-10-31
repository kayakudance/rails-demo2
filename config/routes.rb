Rails.application.routes.draw do
  get 'test', to: 'tests#index', as: 'test'

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



end
