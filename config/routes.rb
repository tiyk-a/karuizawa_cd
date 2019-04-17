Rails.application.routes.draw do

  devise_for :users
  root :to => "root#top"
  get '/about' => 'root#about',as: 'about'
  resources :songs,only: [:show,:new,:create,:edit,:update]
  resources :cart_items,only: [:show,:create,:update,:destroy]
  resources :orders,only:[:index,:show,:create,:edit,:update]
  get '/checkout' => 'orders#checkout',as: 'checkout'
  get '/confirmation' => 'orders#confirmation',as: 'confirmation'

  get 'categories/index'
  get 'categories/show'
  get 'labels/index'
  get 'cds/new'
  get 'cds/index'
  get 'cds/show'
  get 'cds/edit'
  get 'artists/new'
  get 'artists/edit'
  get 'artists/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
