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

  get 'login', to: 'sessions#new'
  post :login, to: 'sessions#create'
end
