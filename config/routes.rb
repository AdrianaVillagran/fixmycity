Rails.application.routes.draw do

  root to: "reports#index"

  get 'site/index'

  post 'reports/:id/confirm', to: "reports#confirm", as: 'confirm_report'
  resources :reports

  resources :confirmed_issues
  
end
