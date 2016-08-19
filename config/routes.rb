Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

post '/signup' => 'users#create'
#get '/users' => 'users#index'
post '/login' => 'users#login'
get  '/logout' => 'users#destroy'

resources :users, only: [:show] do
    member do
      get 'posts' => 'posts#show'
      get :friends
      get :inviters
      post :accept_invite
      get 'feeds' => 'users#feeds'
resources :posts, only: [:create, :destroy] do

    resources :likes, only: [:create]
  end
       #resources :friendships, only: [:create, :destroy]
       get     'friendships/:fid'  =>   'friendships#create'
       match 'friendships/:fid', to: 'friendships#destroy' , via: [:delete]
       #DELETE     'friendships/:fid' => 'friendships#destroy'
       post 'friend_requests/:fid' => 'friend_requests#create'
       match 'friend_requests/:fid' => 'friend_requests#destroy', via: [:delete]
       get 'friend_requests' => 'friend_requests#show'
       post 'friend_requests/:rid/accept' => 'friend_requests#accept'
  #resources :friend_requests, only: [:create, :destroy]
  resources :comments, only: [:create,:show] do
    resources :likes, only: [:create]
  end
    end
  end
  
 
  #resources :likes, only: [:create]

end
