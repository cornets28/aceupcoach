Rails.application.routes.draw do
  namespace :api, default: { format: 'json' } do
    namespace :v1 do
      resources :users, only: %i[index create]
      resources :coach_instructors, only: %i[index create]

      post '/login', to: 'users#login'
    end
  end
end
