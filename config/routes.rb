Rails.application.routes.draw do
  devise_for :users
  get 'chills/new', to: 'chills#new'
  post 'chills', to: 'chills#create'
  root to: 'chills#index'
end
