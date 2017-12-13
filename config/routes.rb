# == Route Map
#
#                   Prefix Verb   URI Pattern                              Controller#Action
#                 housings GET    /housings(.:format)                      housings#index
#                          POST   /housings(.:format)                      housings#create
#              new_housing GET    /housings/new(.:format)                  housings#new
#             edit_housing GET    /housings/:id/edit(.:format)             housings#edit
#                  housing GET    /housings/:id(.:format)                  housings#show
#                          PATCH  /housings/:id(.:format)                  housings#update
#                          PUT    /housings/:id(.:format)                  housings#update
#                          DELETE /housings/:id(.:format)                  housings#destroy
#                     tags GET    /tags(.:format)                          tags#index
#                          POST   /tags(.:format)                          tags#create
#                  new_tag GET    /tags/new(.:format)                      tags#new
#                 edit_tag GET    /tags/:id/edit(.:format)                 tags#edit
#                      tag GET    /tags/:id(.:format)                      tags#show
#                          PATCH  /tags/:id(.:format)                      tags#update
#                          PUT    /tags/:id(.:format)                      tags#update
#                          DELETE /tags/:id(.:format)                      tags#destroy
#         supplies_neededs GET    /supplies_neededs(.:format)              supplies_neededs#index
#                          POST   /supplies_neededs(.:format)              supplies_neededs#create
#      new_supplies_needed GET    /supplies_neededs/new(.:format)          supplies_neededs#new
#     edit_supplies_needed GET    /supplies_neededs/:id/edit(.:format)     supplies_neededs#edit
#          supplies_needed GET    /supplies_neededs/:id(.:format)          supplies_neededs#show
#                          PATCH  /supplies_neededs/:id(.:format)          supplies_neededs#update
#                          PUT    /supplies_neededs/:id(.:format)          supplies_neededs#update
#                          DELETE /supplies_neededs/:id(.:format)          supplies_neededs#destroy
#              verify_user POST   /users/:id/verify(.:format)              users#verify
# resend_verification_user POST   /users/:id/resend_verification(.:format) users#resend_verification
#                    users GET    /users(.:format)                         users#index
#                          POST   /users(.:format)                         users#create
#                 new_user GET    /users/new(.:format)                     users#new
#                edit_user GET    /users/:id/edit(.:format)                users#edit
#                     user GET    /users/:id(.:format)                     users#show
#                          PATCH  /users/:id(.:format)                     users#update
#                          PUT    /users/:id(.:format)                     users#update
#                          DELETE /users/:id(.:format)                     users#destroy
#            user_sessions GET    /user_sessions(.:format)                 user_sessions#index
#                          POST   /user_sessions(.:format)                 user_sessions#create
#         new_user_session GET    /user_sessions/new(.:format)             user_sessions#new
#        edit_user_session GET    /user_sessions/:id/edit(.:format)        user_sessions#edit
#             user_session GET    /user_sessions/:id(.:format)             user_sessions#show
#                          PATCH  /user_sessions/:id(.:format)             user_sessions#update
#                          PUT    /user_sessions/:id(.:format)             user_sessions#update
#                          DELETE /user_sessions/:id(.:format)             user_sessions#destroy
#               auth_login POST   /auth/login(.:format)                    users#login
#            auth_register POST   /auth/register(.:format)                 users#register
#                  helping GET    /helping(.:format)                       static#home
#         looking_for_help GET    /looking_for_help(.:format)              static#home
#                     root GET    /                                        static#home
#

Rails.application.routes.draw do
  resources :housings
  resources :tags
  resources :supplies_neededs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    post :verify, on: :member
    post :resend_verification, on: :member
    post :reset_password, on: :member
    post :send_password_reset, on: :member
  end
  resources :user_sessions

  post 'auth/login', to: 'users#login'
  post 'auth/register', to: 'users#register'

  # We'll fix these later
  get 'helping', to: 'static#home'
  get 'looking_for_help', to: 'static#home'
  get 'looking_for_help/housing', to: 'static#home'
  get 'helping/housing', to: 'static#home'
  get 'login', to: 'static#home'
  get 'sign_up', to: 'static#home'

  root to: 'static#home'
end
