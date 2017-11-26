Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'camps#index'
  
  devise_for :users,
    controllers: { 
      registrations: 'users/registrations'
  }
  
  resources :camps, :path => 'dreams' do
    resources :images
    resources :people, only: [:show, :update]
    post 'join', on: :member
    
    post 'archive', on: :member
    patch 'toggle_granting', on: :member
    patch 'update_grants', on: :member
    patch 'tag', on: :member
  end
  
  get '/chronicles' => 'camps#index'
  get '/chronicles/:id' => 'camps#index'

  get '/pages/:page' => 'pages#show'
  get '/me' => 'users#me'
  get '/howcanihelp' => 'howcanihelp#index'
  
  get '*unmatched_route' => 'application#not_found'
end