Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  root to: 'pages#home'

  resources :users, only: [:show]

  resources :products do
    resources :orders, only: [:new, :create]
  end

  get "products/:id/confirm", to: "products#confirm"
  get "products/:id/complete", to: "products#complete", as: :complete_products
  # Defines the root path route ("/")
  # root "products#index"
end


# get "tasks", to: "tasks#index"
# get "tasks/new", to: "tasks#new", as: :new_task
# get "tasks/:id", to: "tasks#show", as: :task
# post "tasks", to: "tasks#create"
# get "tasks/:id/edit", to: "tasks#edit", as: :edit_task
# patch "tasks/:id", to: "tasks#update"
# delete "tasks/:id", to: "tasks#destroy"
