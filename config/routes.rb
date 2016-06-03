Rails.application.routes.draw do

  root to: "reports#index"

  get 'site/index'

  # User routes

  resources :users

  # Sessions routes
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  post 'reports/:id/hide', to: "reports#hide", as: 'hide_report'
  post 'reports/:id/confirm', to: "reports#confirm", as: 'confirm_report'
  resources :reports
  resources :confirmed_issues

end
