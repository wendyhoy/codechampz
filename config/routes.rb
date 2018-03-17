Rails.application.routes.draw do

  resources :student_drills
  resources :student_drill_groups
  resources :drill_groups do
    resources :drills, except: :index, shallow: true do
      resources :solutions, except: :index
    end
  end
  
  resources :users, shallow: true do
     resources :student_drill_groups
     resources :student_drills
   end

  resource :session, only: [:new, :create, :delete]

  get('/', { to: 'home#index', as: :root })
  get('/leaderboard', { to: 'home#leaderboard', as: :leaderboard })
   
end
