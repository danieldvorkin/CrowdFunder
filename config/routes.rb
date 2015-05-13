Rails.application.routes.draw do
  
  root 'projects#index'
  
  resources :projects, only: [:index, :create, :new, :show] do
    resources :pledges
  end
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

end
