Rails.application.routes.draw do

  resources :student_drills
  resources :student_drill_groups
  resources :solutions
  resources :drill_groups do
    resources :drills, except: :index, shallow: true
  end
  resources :users

  resource :session, only: [:new, :create, :delete]
end
