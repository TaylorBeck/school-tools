Rails.application.routes.draw do
  root 'students#index'

  resources :students, only: [:index, :new, :create]
end
