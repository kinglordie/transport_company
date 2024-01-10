Rails.application.routes.draw do
  resources :drivers
  resources :counterparties
  resources :fuels, only: [:index, :new, :create]
  resources :salaries
  resources :truck_repairs, only: [:index, :new, :create]
  resources :trailer_repairs, only: [:index, :new, :create]
  devise_for :users
  resources :trucks
  resources :trailers
  resources :reis_tables
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  get '/profile', to: 'profiles#show', as: 'profile'
  resources :users, only: [:index] do
    patch :update_role, on: :member
  end
  
  # Defines the root path route ("/")
  # root "posts#index"
end
