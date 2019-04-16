Rails.application.routes.draw do

  devise_for :users
  resources :artists, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :labels, only: [:create, :update, :index, :destroy]
  resources :cds do
    resource :favorite, only: [:create, :destroy]
  end
  resources :labels, only: [:create, :index, :show, :destroy]
  resources :categories, only: [:create, :index, :show]
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
