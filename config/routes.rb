Rails.application.routes.draw do
  devise_for :users
  get 'chills', to: 'chills#index'
  get 'chills/new', to: 'chills#new'
  post 'chills', to: 'chills#create'
end
