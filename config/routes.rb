Rails.application.routes.draw do

  # Authentication with social providers.
  get "auth/use/:provider" => "oauths#use_provider", as: "use_provider"
  get "/auth/:provider/callback" => "oauths#create"
  delete "/auth/:provider" => "oauths#destroy", as: "auth"
  get "/auth/failure" => "oauths#failure"

  get "/autocomplete", to: "application#autocomplete"

  namespace :m3_table_admin, path: "admin" do
    get "/", to: "users#index"
    get "/autocomplete", to: "application#autocomplete"

    resources :pages
    resources :users
    resources :images
    resources :partners
    resources :projects
    resources :our_companies
    resources :expense_categories
    resources :invoices
  end

  get '/pages/*slug' => 'pages#show', :as => 'page'


  resources :users
  resources :vacations
  resources :invoices
  resources :payments
  resources :expenses
  resources :scrums do
    collection do
      get :last
      get :edit_task
      patch :update_task
    end
  end
  resources :sessions, only: [:new, :create, :destroy] #we limit to just those actions, because we dont need other actions
  match '/signup',  to: 'users#new', via: 'get'
  match '/login',  to: 'sessions#new', via: 'get'
  match '/logout', to: 'sessions#destroy', via: 'delete'

  root to: "main#index", as: :root
  match "/", to: "sessions#new", via: 'get'

end
