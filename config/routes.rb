Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#resources :products

post '/products/new' => 'products#new'
get '/products/show' => 'products#show'
get '/products' => 'products#index'
get '/products/seller/:id' => 'products#get_seller_pdts'


resources :wishlists
resources :carts
end
