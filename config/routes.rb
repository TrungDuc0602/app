Rails.application.routes.draw do
  get 'home/index'
  resources :line_items
  resources :carts
  get 'store/index'
  resources :types
  resources :providers
  resources :products
  resources :combos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => 'home#index'
end
