Rails.application.routes.draw do
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

  post 'cart/added', to: 'carts#add_items'
end
