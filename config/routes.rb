Rails.application.routes.draw do
  root   'events#index'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  post   '/attend',    to: 'events#add_attendee'
  get    '/signup',   to: 'users#new'
  post   '/signup',   to: 'users#create'
  delete '/logout',   to: 'sessions#destroy'
  resources :users, only:[:new, :create, :show]
  resources :events, only:[:new, :create, :show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
