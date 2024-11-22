Rails.application.routes.draw do
  resources :students
  resources :courses
  root 'courses#index'
  get 'courses/new', to: 'courses#new'
  
  get 'about', to: 'pages#about'

end
