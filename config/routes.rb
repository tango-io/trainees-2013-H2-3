StarfishApp::Application.routes.draw do
  #root page
  root 'home#index'
  resources :projects
  #Users page
  devise_for :users, controller: 'user/users', path_names: {sing_in: "login", sing_out: "logout"}
  resources :backs, controller: 'user/backs'
  #admin page
  resources :categories, controller:'admin/categories'
  resources :admin, controller: 'admin/home'

end
