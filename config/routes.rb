GeneralAssembly::Application.routes.draw do

  root "static#home"

  get '/about', to: "static#about"
  get '/contact', to:"static#contact"
  get '/apply', to: 'users#new'
  

  resources :users
    get '/dashboard', to: "users#dashboard"
    get '/students', to: 'users#students'
    get '/teachers', to: 'users#teachers' 

  resources :sessions
    get '/logout', to: 'sessions#destroy'

  resources :courses
    get '/signup/:id', to: 'courses#sign_up'
    get '/courses/:id/drop', to: 'courses#drop_student'

  resources :rooms

end
