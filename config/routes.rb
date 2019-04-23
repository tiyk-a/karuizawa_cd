Rails.application.routes.draw do

  get 'inquiries/index'
  get 'inquiries/new'
  get 'inquiries/show'
  get 'inquiries/edit'
  #chiharu
 
  resources :artists, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :labels, only: [:create, :update, :index, :destroy]
  resources :cds do
    resources :comments, only: [:create], shallow: true do
      resources :comment_replies, only: [:create, :destroy]
    end
    resource :favorite, only: [:create, :destroy]
  end
delete 'cd/:id/comments/:id', to: 'comments#destroy', as: 'cd_comment'
  resources :labels, only: [:create, :index, :show, :destroy]
  resources :categories, only: [:create, :index, :show]
  
  #ryo
  root :to => "root#top"
  get '/about' => 'root#about',as: 'about'
  resources :songs,only: [:show,:new,:create,:edit,:update]
  resources :cart_items,only: [:show,:create,:update,:destroy]
  resources :orders,only:[:index,:show,:create,:edit,:update]
  get '/checkout' => 'orders#checkout',as: 'checkout'
  get '/confirmation' => 'orders#confirmation',as: 'confirmation'

  # get 'categories/index'
  # get 'categories/show'
  # get 'labels/index'
  # get 'cds/new'
  # get 'cds/index'
  # get 'cds/show'
  # get 'cds/edit'
  # get 'artists/new'
  # get 'artists/edit'
  # get 'artists/show'
  
  #kazumi
  resources :users, only: [:show, :index, :create,:edit]
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
} 
  devise_scope :user do
    get "user/:id", :to => "users#show"
    get "signup", :to => "users/registrations#new"
    get "users/edit", :to => "users/registrations#edit"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
end