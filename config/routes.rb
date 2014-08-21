Rails.application.routes.draw do

  # Authentication with social providers.
  get "auth/use/:provider" => "oauths#use_provider", as: "use_provider"
  get "/auth/:provider/callback" => "oauths#create"
  delete "/auth/:provider" => "oauths#destroy", as: "auth"
  get "/auth/failure" => "oauths#failure"

  namespace :m3_table_admin, path: "admin" do
    get "/", to: "users#index"
    get "/autocomplete", to: "application#autocomplete"

    resources :pages
    resources :users
    resources :images
    resources :projects
  end

  get '/pages/*slug' => 'pages#show', :as => 'page'


  resources :users
  resources :sessions, only: [:new, :create, :destroy] #we limit to just those actions, because we dont need other actions
  match '/signup',  to: 'users#new', via: 'get'
  match '/login',  to: 'sessions#new', via: 'get'
  match '/logout', to: 'sessions#destroy', via: 'delete'

  root to: "sessions#new", as: :root
  match "/", to: "sessions#new", via: 'get'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
