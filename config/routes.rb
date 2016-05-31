Rails.application.routes.draw do

  root to: "reports#index"

  get 'site/index'
  resources :reports
  post 'reports/:id/confirm', to: "reports#confirm", as: 'confirm_report'
end
