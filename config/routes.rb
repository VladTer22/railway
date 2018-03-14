Rails.application.routes.draw do
  resources :trains
  resources :railway_stations do
    member do
      post :update_position
    end
  end
  resources :routes
  resources :carriages
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
