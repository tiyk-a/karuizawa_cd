Rails.application.routes.draw do

  devise_for :users
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
