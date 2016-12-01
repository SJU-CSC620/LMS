Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'signup' , to: 'users#signup'
  get 'displaycredentials' , to: 'welcome#displaycredentials'
  
  
  
  resources :credentials
  get 'signup' , to: 'users#signup'
  resources :users, except: [:new,:show]
  get 'users/:id/search' , to: 'users#search' , as: 'search_user'
  get 'users/:id/viewBooks' , to: 'users#viewBooks' , as: 'viewBooks_user'
  get 'users/:id/results' , to: 'users#results' , as: 'results_user'
  get '/users/:id/:bookid' => 'users#selectbook', :as => :selectbook
  get '/users/:id/:booklogid/returnbook' => 'users#returnbook', :as => :returnbook
  #resources :credentials
  resources :admins, except: [:new,:show]

  get '/admins/:id' , to: 'admins#adminhome'
  get 'admins/:id/search' , to: 'admins#search' , as: 'search_admin'
  get 'admins/:id/results' , to: 'admins#results' , as: 'results_admin'
  get '/admins/:bookid' => 'admins#editbook', :as => :editbook
  patch 'credentials/:id' , to: 'credentials#update'
  
  resources :books
  get '/books/:id/new', to: 'books#create'

  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  get '/users/:id' , to: 'users#userhome'

  # patch 'users/editpassword/:id' , to: 'users#updatepassword'
  # put 'users/editpassword/:id' , to: 'users#updatepassword'
  #post '/credentials/:id/edit' , to: 'credentials#edit'
  delete 'logout', to: 'sessions#destroy'
end
