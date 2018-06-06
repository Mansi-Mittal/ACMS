Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#resources :products

post '/products/new' => 'products#new'
get '/products/show' => 'products#show'
get '/products' => 'products#index'
get '/products/seller/:id' => 'products#get_seller_pdts'

post '/wishlists/new' => 'wishlists#new'
get '/wishlists' => 'wishlists#index'

post '/carts/new' => 'carts#new'
get '/carts' => 'carts#index'

get '/products/search' => 'products#search'

#post '/paytm/generateChecksum.rb' => 'generate_checksum#unknown'

namespace :api do
    namespace :mobile do
      post "generate-checksum" => "paytms#generate_checksum"
      post "verify-checksum" => "paytms#verify_checksum"
    end
  end
#resources :wishlists
#resources :carts
end
