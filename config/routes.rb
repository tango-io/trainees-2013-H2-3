StarfishApp::Application.routes.draw do
  get "categories", to: "categories#index"
  #root page
  root 'home#index'
  resources :projects do
    member do
      get :approve
    end
  end
  #Users page
  devise_for :users, controller: 'user/users', path_names: {sing_in: "login", sing_out: "logout"}
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
