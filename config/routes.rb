Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  resources :questions
  resources :answers, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
