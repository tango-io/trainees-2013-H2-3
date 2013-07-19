StarfishApp::Application.routes.draw do

  devise_for :users, path_names: {sing_in: "login", sing_out: "logout"}
  resources :projects
  get '/profile/:id', to: 'users#show'
  root 'users#index'
  
end
