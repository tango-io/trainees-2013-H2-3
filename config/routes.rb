StarfishApp::Application.routes.draw do
  get "categories", to: "categories#index"
  #root page
  root 'home#index'
  resources :projects
  #Users page
  devise_for :users, controller: 'user/users', path_names: {sing_in: "login", sing_out: "logout"}
  resources :backs, controller: 'user/backs'
  #admin page
  namespace :admin do
    resources :categories, :home
  end

end
