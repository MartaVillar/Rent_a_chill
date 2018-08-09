Rails.application.routes.draw do

  root to: 'chills#index'

 devise_for :users, :path_prefix => 'd'
 resources :users, :only =>[:show, :edit]

  get 'chills/new', to: 'chills#new'
  post 'chills', to: 'chills#create'

  resources :chills, :only => [:show]

  # booking a chill

  get 'chills/book/:id', to: 'chills#book', as: :book



end
