Rails.application.routes.draw do
  resources :multiplayer_games
  resources :games
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  resource :friendships, only: [:create]
  resources :conversations, only: [:index, :create]
  resources :messages, only: [:create]
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
