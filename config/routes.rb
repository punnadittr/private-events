Rails.application.routes.draw do
  get   '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  root   'users#new'
  get    '/signup',  to: 'users#new'
  post    '/signup', to: 'users#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users, only:[:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
