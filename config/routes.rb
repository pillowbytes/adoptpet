Rails.application.routes.draw do
  devise_for :users
  resources :pets do
    member do
      get :modal
    end
  end
  resources :orders, only: [:index, :show, :new, :create, :destroy]

  root to: "pets#index"

  get 'users/orders/new/:pet_id', to: 'orders#new', as: 'new_user_order'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
