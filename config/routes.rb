Rails.application.routes.draw do
  resources :teacher_courses
  resources :student_courses
  resources :courses
  resources :student_assignments
  resources :assignments
  resources :students
  resources :teachers
  post '/login', to: 'auth#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
