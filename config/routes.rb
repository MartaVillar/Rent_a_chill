Rails.application.routes.draw do

  get 'bookings/new'
  get 'bookings/create'
  root to: 'chills#index'

 devise_for :users, :path_prefix => 'd'
 resources :users, :only =>[:show, :edit]

  get 'chills/new', to: 'chills#new'
  post 'chills', to: 'chills#create'

  resources :chills, :only => [:show, :edit] do
    resources :bookings, only: [:new, :create]
  end

  # booking a chill
end
