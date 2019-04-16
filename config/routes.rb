Rails.application.routes.draw do
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
