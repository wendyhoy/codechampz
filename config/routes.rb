Rails.application.routes.draw do

  resources :student_drills
  resources :student_drill_groups
  resources :solutions
  resources :drills
  resources :drill_groups
  resources :users
  resource :session, only: [:new, :create, :delete]

  get('/', { to: 'home#index', as: :root })
  get('/leaderboard', { to: 'home#leaderboard', as: :leaderboard })
   
end
