StarfishApp::Application.routes.draw do

  get "categories", to: "categories#index"
  get "projects", to: "projects#index"
  get "projects/:id", to: "projects#show"
  #root page
  root 'home#index'
  #Users page
  devise_for :users, controller: 'user/users', path_names: {sing_in: "login", sing_out: "logout"}
  namespace :user do
    resources :projects
  end
  resources :backs, controller: 'user/backs'
  #admin page
  namespace :admin do
    resources :categories, :home, :projects
    resources :backs do
      collection do
        get :monney_to_give
        get :revenue
      end
    end
  end

end
