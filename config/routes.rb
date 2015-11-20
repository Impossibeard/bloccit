Rails.application.routes.draw do
  #get 'posts/index'

  #get 'posts/show'

  #get 'posts/new'

  #get 'posts/edit'

#instructs rails to create post routes for creating, updating, viewing, and deleting instances of Post
  resources :topics do
    resources :posts, except: [:index]
  end

  #get 'welcome/index'

  #get 'welcome/about'

  #we remove get "welcome/index" because we've declared the index view as the root view. We also modify the about route to allow users to visit /about, rather than /welcome/about.
  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
