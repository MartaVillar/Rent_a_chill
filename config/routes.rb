Rails.application.routes.draw do
  root to: 'chills#index'

  devise_for :users

  get 'chills/new', to: 'chills#new'
  post 'chills', to: 'chills#create'
end
