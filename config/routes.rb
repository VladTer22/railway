Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :tickets, only: [:index]
  root 'searches#show'

  resource :search, only: %i[show new edit] do
    post '/', to: 'searches#search'
  end

  resources :tickets, only: %i[show destroy]

  resources :trains do
    resources :tickets, only: %i[new create]
  end

  namespace :admin do
    resources :railway_stations do
      member do
        post :update_position
        post :update_time
      end
    end

    resources :trains do
      resources :carriages, shallow: true
    end

    resources :tickets, only: %i[index show edit destroy]

    resources :routes

    get 'welcome/index'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
