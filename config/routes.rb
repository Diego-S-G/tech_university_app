Rails.application.routes.draw do
  resources :students, except: [ :destroy ]

  resources :courses, except: [ :index ]
  root 'courses#index'
  
  get 'about', to: 'pages#about'

  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'

  post 'course_enroll', to: 'student_courses#create'
  delete 'delete_student_course', to: 'student_courses#destroy'
end
