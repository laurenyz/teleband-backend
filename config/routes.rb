Rails.application.routes.draw do
  resources :teacher_courses
  resources :student_courses
  resources :courses
  resources :student_assignments
  resources :assignments
  resources :students
  resources :teachers
  post '/login', to: 'auth#create'
  get '/teacher/profile', to: 'teachers#profile'
  get '/student/profile', to: 'students#profile'
  patch '/teacher/updategrades', to: 'teachers#updategrades'
  patch '/student_assignments/:assignment_id/submit_recording', to: 'student_assignments#attach_recording'
  patch '/student_assignments/:assignment_id/submit_response', to: 'student_assignments#attach_response'
  patch '/student_assignments/:assignment_id/submit_notation', to: 'student_assignments#attach_notation'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
