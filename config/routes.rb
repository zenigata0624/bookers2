Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top', as: "top"
  get 'homes/about' => "homes#about" , as: "about"
  resources :books, only: [:new,:create, :index, :show, :edit , :destroy ]
  resources :users, only: [:show,:edit,:update,:index,]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
