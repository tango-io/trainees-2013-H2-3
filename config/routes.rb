StarfishApp::Application.routes.draw do

  devise_for :users, path_names: {sing_in: "login", sing_out: "logout"}
  root 'home#index'
  resources :categories, controller:'admin/categories'
  resources :admin, controller: 'admin/home'
  resources :projects
  resources :backs
  get '/profile/:id', to: 'users#show'

end
