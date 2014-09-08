Rails.application.routes.draw do
  devise_for :profiles
  root to: 'games#index'
  resources :games

  resources :profiles
end
