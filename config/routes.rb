Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'signup' , to: 'users#signup'
  get 'displaycredentials' , to: 'welcome#displaycredentials'
  
  #resources :credentials
  get 'signup' , to: 'users#signup'
  resources :users, except: [:new,:show]
  
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  get '/users/:id' , to: 'users#userhome'
  delete 'logout', to: 'sessions#destroy'
end
