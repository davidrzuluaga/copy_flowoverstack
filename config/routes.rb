Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'
  
  resources :questions do
    resource :questionvotes, only: [:create, :destroy]
  end
  
  resources :answers, only: [:create, :destroy] do
    resource :answervotes, only: [:create, :destroy]
  end

  resources :comments, only: [:create, :destroy] 
  
end
