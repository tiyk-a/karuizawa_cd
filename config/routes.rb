Rails.application.routes.draw do
  #chiharu
  devise_for :users
  
  resources :artists, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :labels, only: [:create, :update, :index, :show, :destroy]
  resources :categories, only: [:create, :index, :show]
  resources :cds do
<<<<<<< HEAD

    #ryo
    resources :cart_items,only: [:show,:create,:update,:destroy]

    resources :disc_numbers,only:[:new,:edit,:create,:update,:destroy] do
      resources :songs,only:[:new,:edit,:create,:update,:destroy]
    end
    #/ryo

    resources :comments, only: [:create], shallow: true do
      resources :comment_replies, only: [:create, :destroy]
=======
    resources :comments, only: [:create, :update], shallow: true do
      resources :comment_replies, only: [:create, :update, :destroy]
>>>>>>> 9a93ce0e1c19767d1838a22ce6141c802cd2de1b
    end
    resource :favorite, only: [:create, :destroy]
  end

  delete 'cd/:id/comments/:id', to: 'comments#destroy', as: 'cd_comment'

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end
  resources :pickups, only: [:new, :create, :edit, :update, :show, :destroy]

  #ryo
  root :to => "root#top"
  get '/about' => 'root#about',as: 'about'
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
end