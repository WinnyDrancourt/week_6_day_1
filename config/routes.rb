Rails.application.routes.draw do
  # get 'user/show'
  # get 'user/edit'
  # get 'user/new'
  # get 'user/index'
  # get 'gossip/show'
  # get 'gossip/edit'
  # get 'gossip/new'
  # get 'gossip/index'
  root to: 'gossip#index'
  resources :gossip
  resources :user
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'

  # get '/welcome', to: 'dynamic#welcome'
  # get '/welcome/:first_name', to: 'dynamic#welcome', as: 'first_name'
  # get '/team', to: 'static#team'
  # get '/contact', to: 'static#contact'
  # get '/user/:id', to: 'dynamic#user', as: 'user'
  # get '/gossip/:id', to: 'dynamic#gossip', as: 'gossip'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
