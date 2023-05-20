Rails.application.routes.draw do
  root to: "home#top"
  devise_for :users
  get 'home/about' => 'home#about', as: "about"
  
  resources :books, only: [:index,:show,:edit,:create,:update,:destroy] do
    resource :favorites, only: [:create,:destroy]
    resources :book_comments, only: [:create,:destroy]
  end
  
  resources :users, only: [:show,:edit,:index,:update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
