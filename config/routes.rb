Rails.application.routes.draw do
  devise_for :profiles
  root to: 'profiles#index'
  resources :profiles

  resources :games
end
