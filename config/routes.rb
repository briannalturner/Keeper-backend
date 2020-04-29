Rails.application.routes.draw do
  resources :messages
  resources :likes
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  delete '/likes', to: 'likes#delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
