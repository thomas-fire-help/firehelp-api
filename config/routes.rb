Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :user_sessions

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  get 'signup' => 'users#new', as: :signup

  get 'looking-for-help', to: 'static#home'
  get 'helping', to: 'static#home'
  root to: 'static#home'
end
