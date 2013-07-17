StarfishApp::Application.routes.draw do
  devise_for :users, path_names: {sing_in: "login", sing_out: "logout"}
  get '/profile/:id', to: 'users#profile', as: 'user'
  root to: "users#index"
end
