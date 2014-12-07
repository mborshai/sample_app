SampleApp::Application.routes.draw do
  resources :course_offereings

  resources :courses

  resources :faculties

  get "users/new"
  resources :users 
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'static_pages#home'
  
  
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  match '/main', to: 'course_offereings#main', via: 'get'
  match '/filter', to: 'course_offereings#filter', via: 'post'

  match '/courses', to: 'courses#index', via: 'get'
  match '/faculties', to: 'faculties#index', via: 'get'

end