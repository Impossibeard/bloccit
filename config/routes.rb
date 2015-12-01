Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  #get 'welcome/index'

  #get 'welcome/about'

  #we remove get "welcome/index" because we've declared the index view as the root view. We also modify the about route to allow users to visit /about, rather than /welcome/about.
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
