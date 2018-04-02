Rails.application.routes.draw do

  resources :drill_groups do
    resources :drills, except: :index, shallow: true do
      get 'solutions', on: :member
      resources :solutions, except: :index
    end
  end

  resources :users, except: :destroy, shallow: true do
    resources :student_drill_groups
     resources :student_drills
   end

  resource :session, only: [:create, :destroy]
  get('/sign_in', { to: 'sessions#new' })
  get('/sign_in_as_guest', { to: 'sessions#create_guest' })

  get('/', { to: 'home#index', as: :root })
  get('/leaderboard', { to: 'home#leaderboard', as: :leaderboard })

  get('/next', { to: 'student_drills#next', as: :next })

end
