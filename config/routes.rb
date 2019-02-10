Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'camps#index'
  
  devise_for :users,
    controllers: { 
      registrations: 'users/registrations'
  }
  
  resources :camps, :path => 'dreams' do
    get 'export', on: :collection, to: 'camps#export_csv'

    resources :images do
      post 'set_default_image', on: :member
    end

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

  get '/people/export' => 'people#export_csv'

  post '/verify_email' => 'persons#verify_email'
  
  get '*unmatched_route' => 'application#not_found'
end
