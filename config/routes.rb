Rails.application.routes.draw do
  devise_for :users,controllers: { sessions: 'sessions' }
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route 
  root 'welcome#index'



  # Application resources
  resources :categories, only: [:index,:new,:create] do 
  resources :payments, only: [:index,:new,:create,:show] 
  end
  

end
