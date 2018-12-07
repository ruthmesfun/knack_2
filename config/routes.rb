Rails.application.routes.draw do
  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"}
  resources :users
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  get '/', to: 'application#index'
  delete '/logout', to:'sessions#destroy'
  resources :categories, :comments, :questions, :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
