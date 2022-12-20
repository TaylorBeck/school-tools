Rails.application.routes.draw do
  resources :classrooms
  root 'students#index'

  resources :students
end
