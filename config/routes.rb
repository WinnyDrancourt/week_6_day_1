Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/edit'
  get 'cities/show'

  root to: 'gossips#index'
  resources :users
  resources :cities, only: [:index, :show]
  resources :gossips do
    resources :comments
  end
  
  resources :sessions, only: [:new, :create, :destroy]

  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
