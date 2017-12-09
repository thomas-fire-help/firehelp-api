Rails.application.routes.draw do
  resources :supplies_neededs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :user_sessions

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  get 'signup' => 'users#new', as: :signup
  post 'auth/login', to: 'users#login'
  post 'auth/register', to: 'users#register'

  root to: 'static#home'
end
