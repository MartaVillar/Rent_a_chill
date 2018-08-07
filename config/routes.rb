Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  devise_for :users
  get 'users/:id' => 'users#show'
end
