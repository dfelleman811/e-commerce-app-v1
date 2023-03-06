Rails.application.routes.draw do
 
  root "products#index"

  resources :users, :products, :carts

  post "cart_items" => "cart_items#create"

  resources :sessions, only: [:new, :create, :destroy]
end
