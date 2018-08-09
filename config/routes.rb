Rails.application.routes.draw do

  root to: 'chills#index'

 devise_for :users, :path_prefix => 'd'
 resources :users, :only =>[:show]

  get 'chills/new', to: 'chills#new'
  post 'chills', to: 'chills#create'

  get 'chills/show/:id', to: 'chills#show'

  # booking a chill

  get 'chills/book/:id', to: 'chills#book', as: :book



end
