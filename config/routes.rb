Rails.application.routes.draw do

  root to: "reports#index"

  get 'site/index'

  # User routes

  resources :users
  # # get 'users', to: "users#index", as: "users"
  # get 'users/new', to: 'users#new', as: "new_user"
  # post 'users', to: 'users#create', as: "create_user"
  # get 'users/:id', to: 'users#show', as: 'user'


  # Sessions routes
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  get "/logout", to: "sessions#destroy"


  post 'reports/:id/confirm', to: "reports#confirm", as: 'confirm_report'
  resources :reports
  resources :confirmed_issues

end

##################
#                #
#    ROUTES      #
#                #
##################

#                 root GET    /                                    reports#index
#           site_index GET    /site/index(.:format)                site#index
#       confirm_report POST   /reports/:id/confirm(.:format)       reports#confirm
#              reports GET    /reports(.:format)                   reports#index
#                      POST   /reports(.:format)                   reports#create
#           new_report GET    /reports/new(.:format)               reports#new
#          edit_report GET    /reports/:id/edit(.:format)          reports#edit
#               report GET    /reports/:id(.:format)               reports#show
#                      PATCH  /reports/:id(.:format)               reports#update
#                      PUT    /reports/:id(.:format)               reports#update
#                      DELETE /reports/:id(.:format)               reports#destroy
#     confirmed_issues GET    /confirmed_issues(.:format)          confirmed_issues#index
#                      POST   /confirmed_issues(.:format)          confirmed_issues#create
#  new_confirmed_issue GET    /confirmed_issues/new(.:format)      confirmed_issues#new
# edit_confirmed_issue GET    /confirmed_issues/:id/edit(.:format) confirmed_issues#edit
#      confirmed_issue GET    /confirmed_issues/:id(.:format)      confirmed_issues#show
#                      PATCH  /confirmed_issues/:id(.:format)      confirmed_issues#update
#                      PUT    /confirmed_issues/:id(.:format)      confirmed_issues#update
#                      DELETE /confirmed_issues/:id(.:format)      confirmed_issues#destroy
