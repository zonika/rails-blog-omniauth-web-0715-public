RailsBlog::Application.routes.draw do

  root 'posts#index'

  resources :sessions
  resources :users, :only => [:new, :show, :index]
  resources :tags, :only => [:show, :index]

  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#destroy'
  delete 'logout', :to => 'sessions#destroy'

  resources :posts do
    resources :comments, :only => [:new, :create]
  end

end
