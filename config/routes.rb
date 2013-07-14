GeneralAssembly::Application.routes.draw do
  
  root "static#home"
  get '/about', to: "static#about"
  get '/contact', to:"static#contact"

  resources :sessions
  resources :courses
  resources :students
  resources :teachers
  resources :rooms
  
  get '/schedules', to: 'schedules#index'

  get '/signup/:id', to: 'courses#sign_up'

  get '/logout', to: 'sessions#destroy'

end
