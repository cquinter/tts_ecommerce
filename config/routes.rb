Rails.application.routes.draw do

  root 'storefront#all_items'

  get 'category' => 'storefront#items_by_category'

  get 'brand' => 'storefront#items_by_brand'

  post 'add_to_cart' => 'cart#add_to_cart'

  get 'checkout' => 'cart#checkout'

  get 'view_order' => 'cart#view_order'

  devise_for :users

  resources :products

  resources :categories
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
