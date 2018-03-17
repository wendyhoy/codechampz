Rails.application.routes.draw do
  
  resources :student_drills
  resources :student_drill_groups
  resources :solutions
  resources :drills
  resources :drill_groups
  resources :users

end
