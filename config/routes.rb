Rails.application.routes.draw do
  resources :students, except: [ :destroy ]
  # resources :courses
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  
  get 'about', to: 'pages#about'

  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
end
