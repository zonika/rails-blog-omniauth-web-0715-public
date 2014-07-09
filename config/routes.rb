RailsBlog::Application.routes.draw do

  root 'posts#index'

  get '/auth/github', :as => 'github_login'
  get '/auth/github/callback' => 'sessions#create'

  delete 'logout' => 'sessions#destroy', :as => 'log_out'

  resources :sessions
  resources :users, :only => [:new, :show, :index]
  resources :tags, :only => [:show, :index]
  
  resources :posts do 
    resources :comments, :only => [:new, :create]
  end

end
