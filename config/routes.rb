Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get 'signup' , to: 'credentials#signup'
  get 'displaycredentials' , to: 'welcome#displaycredentials'
  resources :credentials
end
