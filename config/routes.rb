Rails.application.routes.draw do
  devise_for :profiles
  root to: 'profiles#index'
  resources :profiles

  resources :games, except: [:show] do
    get ':my_class' => 'games#my_class', as: :games_my_class, on: :collection
  end
end
