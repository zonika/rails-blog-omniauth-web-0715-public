RailsBlog::Application.routes.draw do

  root 'posts#index'

  get '/auth/github', :as => 'github_login'
  get '/auth/github/callback' => 'sessions#create'

  delete 'logout' => 'sessions#destroy', :as => 'log_out'

  resources :sessions
  resources :users
  resources :tags
  
  resources :posts do 
    resources :comments
  end

end
