Rails.application.routes.draw do
  root 'homes#top'
  get '/home' => 'homes#top'
  get '/home/about' => 'homes#about'

  resources :users,only: [:show,:index,:edit,:update]
  resources :books
  devise_for :users
end
