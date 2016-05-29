Rails.application.routes.draw do

  root to: "reports#index"

  get 'site/index'
  resources :reports

end
