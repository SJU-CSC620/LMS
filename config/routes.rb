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
  get 'admins/:id/searchuser' , to: 'admins#searchuser' , as: 'searchuser_admin'
  get 'admins/:id/resetpassword' , to: 'admins#resetpassword' , as: 'resetpassword_admin'
  get 'admins/:id/userresults' , to: 'admins#userresults' , as: 'userresults_admin'
  get 'admins/:id/recreateuser' , to: 'admins#recreateuser' , as: 'recreateuser_admin'
  get 'admins/:id/createuser' , to: 'admins#createuser' , as: 'createuser_admin'
  post 'admins/:id/saveuser' , to: 'admins#saveuser' , as: 'saveuser_admin'
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
