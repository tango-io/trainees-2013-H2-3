StarfishApp::Application.routes.draw do

  get "categories", to: "categories#index"
  resources :projects
  #root page
  root 'home#index'
  #Users page
  devise_for :users, controller: 'user/users', path_names: {sing_in: "login", sing_out: "logout"}
  resources :users do
    resources :projects
    resources :backs do 
      get :list 
    end
  end
  resources :projects do
    resources :backs do 
      get :list 
    end
  end
  #resources :backs, controller: 'user/backs
  #get 'users/backs', to: 'user/backs#list' 
  #admin page
  namespace :admin do
    resources :categories, :home 
    resources :projects do 
      member do
        get :approve
      end
      collection do
        get :monney_to_give
        get :monney_to_give_betwen_dates
      end
    end
    resources :backs do
      collection do
        get :revenue
      end
    end
  end

end
