Rails.application.routes.draw do

  root to: 'site#index'

  get 'site/index'
  resources :reports

end
