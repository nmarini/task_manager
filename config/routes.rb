Rails.application.routes.draw do

  root 'static_page#home'
  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/auth/facebook/callback' => 'sessions#create'
  post '/logout' => 'session#destroy'
  

  resources :tasks, only: [:create, :destroy, :edit, :update] do 
    resources :users, only: [:show]
  end 

  resources :lists, only: [:index, :show, :create, :update] do
    resources :tasks, only: [:new, :show, :edit, :destroy]
  end 

  resources :users, only: [:create, :destroy, :edit, :update, :show] do
    resources :lists, only: [:new, :edit, :show, :destroy]
  end
  
  resources :users do 
    resources :tasks, only: [:show, :edit]
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
