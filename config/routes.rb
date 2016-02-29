Rails.application.routes.draw do

  root "welcome#index"

  resources :users
  resources :rewards
  resources :user_rewards

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :rewards
  end
end