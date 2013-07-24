StarfishApp::Application.routes.draw do

  devise_for :users, path_names: {sing_in: "login", sing_out: "logout"}
  root 'users#index'
  resources :administrators
  resources :categories
  resources :projects
  resources :backs
  get '/profile/:id', to: 'users#show'

end
