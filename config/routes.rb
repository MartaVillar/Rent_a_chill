Rails.application.routes.draw do

  root to: 'chills#index'

  get '/users/:id',     to: 'users#show'

 devise_for :users, :path_prefix => 'd'
 resources :users, :only =>[:show]


  get 'chills/new', to: 'chills#new'
  post 'chills', to: 'chills#create'

end
