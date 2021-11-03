Rails.application.routes.draw do
  root to: 'homepage#main'
  resources :products, only: %i[new index create show edit update destroy]
end
