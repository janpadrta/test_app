Rails.application.routes.draw do
  resources :items
  resources :deeds
  resources :variants
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'
end