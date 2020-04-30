Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  resources :likes
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  delete '/likes', to: 'likes#delete'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
