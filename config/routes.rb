Rails.application.routes.draw do

  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "tasks#index"
  
  get 'signup', to: 'users#new'
 
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :tasks, only: [:create, :new, :destroy]
  resources :users, only: [:index, :create, :show]
end
