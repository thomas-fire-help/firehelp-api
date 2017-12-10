Rails.application.routes.draw do
  resources :tags
  resources :supplies_neededs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    post :verify, on: :member
    post :resend_verification, on: :member
  end
  resources :user_sessions

  post 'auth/login', to: 'users#login'
  post 'auth/register', to: 'users#register'

  get 'helping', to: 'static#home'
  get 'looking_for_help', to: 'static#home'
  get 'looking_for_help/housing', to: 'static#home'

  root to: 'static#home'
end
