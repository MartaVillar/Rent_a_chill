Rails.application.routes.draw do
  root to: 'chills#index'
  
  get 'users/new'
  get 'users/create'
  devise_for :users
  get 'users/:id', to: 'users#show'

  get 'chills/new', to: 'chills#new'
  post 'chills', to: 'chills#create'
end
