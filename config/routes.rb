RailsBlog::Application.routes.draw do

  root 'posts#index'

  get 'signup' => 'users#new', :as => 'signup'
  get 'login' => 'sessions#new', :as => 'login'

  get '/auth/github', :as => 'github_login'
  get '/auth/github/callback' => 'sessions#create'

  delete 'logout' => 'sessions#destroy', :as => 'logout'

  resources :sessions
  resources :users
  resources :tags
  
  resources :posts do 
    resources :comments
  end

end
