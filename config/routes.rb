Rails.application.routes.draw do
  # get 'relationships/create'
  # get 'relationships/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  root 'homes#top'
  get '/home/about' => 'homes#about'
  get '/home' => 'homes#top'

  devise_for :users

  resources :books do
    resource :favorites, only:[:create, :destroy]
    resources :post_comments, only:[:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :searches,only:[:index]
  # searchesのindexを表示させる為に書いている

end
