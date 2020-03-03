Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'homes#top'
  get '/home/about' => 'homes#about'
  get '/home' => 'homes#top'

  devise_for :users

  resources :books do
    resource :favorites, only:[:create, :destroy]
    resource :post_comments, only:[:create, :destroy]
  end
  resources :users,only: [:show,:index,:edit,:update]

end
