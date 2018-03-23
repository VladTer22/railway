Rails.application.routes.draw do
  devise_for :users
  resources :trains do
    resources :carriages, shallow: true
    resources :tickets, only: %i[new create]
  end
  resources :tickets, only: [:index]
  root 'searches#show'

  resource :search, only: %i[show new edit] do
    post '/', to: 'searches#search'
  end
  resources :railway_stations do
    member do
      post :update_position
      post :update_time
    end
  end
  resources :routes
  get 'welcome/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
