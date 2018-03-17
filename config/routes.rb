Rails.application.routes.draw do

  resources :drill_groups do
    resources :drills, except: :index, shallow: true do
      resources :solutions, except: :index
    end
  end
  
  resources :users, except: :destroy, shallow: true do
     resources :student_drill_groups
     resources :student_drills
   end


  get('/', { to: 'home#index', as: :root })
  get('/leaderboard', { to: 'home#leaderboard', as: :leaderboard })

end
