Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  root to: 'homepage#main'

  resources :products, only: %i[new index create show edit update destroy] do
    get :search, on: :collection
  end

  resources :accounts, only: %i[index new create]

  post '/addItem', to: 'cart#addItem'
  get '/cart_confirmation', to: 'cart#confirmation'
  get '/cart', to: 'cart#show'
  delete '/cart', to: 'cart#delete'

  get 'login', to: 'sessions#new'
  post :login, to: 'sessions#create'

  get 'password_reset', to: 'accounts#reset_password'
  post 'password_reset', to: 'accounts#send_email_password'
end
