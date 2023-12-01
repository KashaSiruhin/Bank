Rails.application.routes.draw do
  get '/courses/add/:id', to: "courses#add", as: :add_course
  get '/courses/remove/:id', to: "courses#remove", as: :remove_course
  resources :courses
  root "home#index"
  get '/home/index', to: "home#index"
  get '/profile', to: "home#profile", as: :profile
  devise_for :users, controllers: { registrations: 'users/registrations' }
end
