StarfishApp::Application.routes.draw do

  devise_for :users, path_names: {sing_in: "login", sing_out: "logout"}
  resources :projects
  root 'users#index'
  
end
