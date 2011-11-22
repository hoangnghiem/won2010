Won2010::Application.routes.draw do |map|
  # FRONT SITE AREA ROUTING
  # ============================================================================
  scope :module => "users/auction_tools" do
    resources :items, :path => "/auction_tools/items"
    resources :invitations, :path => "/invite", :only => [:new, :create]
  end

  scope :module => "users/account" do
    resources :profiles, :path => "/account/profile"
  end

  devise_for :users, :controllers => {
    :sessions => "users/account/sessions",
    :passwords => "users/account/passwords",
    :unlocks => "users/account/unlocks",
    :registrations => "users/account/registrations",
    :confirmations => "users/account/confirmations"
  }, :path_names => { :sign_in => 'login', :sign_out => 'logout' }
  match 'users/sign_up(/:referer_id)', :to => 'users/account/registrations#new', :as => :refer_sign_up

  root :to => "main/index#index"
  match 'users/last_step' => 'users/account/registrations#last_step', :as => :registration_last_step
  match 'auction_tools' => 'users/auction_tools/index#index', :as => :auction_tools
  match 'auction_center' => 'main/auctions#index'
  match 'fetch_contacts' => 'users/auction_tools/invitations#fetch_contacts', :as => :fetch_contacts, :method => :post
  match '/watchings' => 'users/auction_tools/watchings#index', :as => :watchings
  match '/watch/:auction_id' => 'users/auction_tools/watchings#create', :methods => :post, :as => :watch
  match '/remove_watch/:auction_id' => 'users/auction_tools/watchings#destroy', :methods => :delete, :as => :remove_watch

  scope :module => "main" do
    resources :auctions, :only => [:show]
    resources :bids, :only => [:create]
    resources :comments, :only => [:create]
  end

  # ADMIN AREA ROUTING
  # =====================================================================
  devise_for :admins, :path => 'admin', :controllers => {
    :sessions => "admin/account/sessions",
    :passwords => "admin/account/passwords",
    :unlocks => "admin/account/unlocks"
  }, :path_names => { :sign_in => "login", :sign_out => "logout" }

  namespace "admin" do
    resources :admins
    resources :roles
    resources :users
    resources :pages
  end

  match 'admin' => 'admin/dashboard#index', :as => :admin_root_path

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

