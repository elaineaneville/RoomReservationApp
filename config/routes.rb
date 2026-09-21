# config/routes.rb
Rails.application.routes.draw do
  root "sites#index"

  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  resources :sites, only: [:index, :show]
  resources :rooms, only: [:index, :show]
  resources :reservations, only: [:index, :show, :new, :create, :destroy]

  namespace :admin do
    resources :reservations, only: :index do
      member do
        patch :approve
        patch :deny
      end
    end
    resources :rooms
    resources :sites
  end
end