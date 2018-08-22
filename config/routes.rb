Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  resources :questions
  resources :answers, only: [:create]
  resources :comments, only: [:create]
end
