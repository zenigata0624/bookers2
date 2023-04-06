Rails.application.routes.draw do

  resources :posts
  get 'followings/followers'
  devise_for :users
  root to: 'home#top'
  get  'home/about'
  get "search" => "searches#search"
  
  resources :groups do
    get "join" => "groups#join"
  end
  
  resources :books, only: [:new,:create, :index, :show, :edit ,:update, :destroy ] do
   resource :favorites, only: [:create,:destroy]
   resources :book_comments,only: [:create,:destroy]
  end
  
  resources :chats, only: [:show,:create]
  
  resources :users, only: [:show,:edit,:update,:index,]  do
      member do
        get :followings, :followers
      end
      
    resource :relationships, only: [:create,:destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
   
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
