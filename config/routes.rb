Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, cotroller: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  resources :products, only:[:index, :show]
end
