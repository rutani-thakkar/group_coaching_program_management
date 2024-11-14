Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :companies, only: [:show]
  resources :coaches do
    member do
      get 'dashboard'
    end
  end

  resources :companies do
    resources :employees, only: [:new, :create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
