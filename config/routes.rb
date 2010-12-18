ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate', :controller => 'users', :action => 'activate'
  map.meta_data '/meta_data', :controller => 'admins', :action => 'meta_data'
  map.upload '/upload', :controller => 'bulk_uploads', :action => 'upload_products_file'
  map.upload_compscraper_file '/upload_compscraper_file', :controller => 'bulk_uploads', :action => 'upload_compscraper_file'
  map.save '/save', :controller => 'bulk_uploads', :action => 'save_product_file'
  map.save_compscraper '/save_compscraper', :controller => 'bulk_uploads', :action => 'save_compscraper_file'
  map.revert '/revert/:id', :controller => 'bulk_uploads', :action => 'revert_products'
  map.revert_compscraper '/revert_compscraper/:id', :controller => 'bulk_uploads', :action => 'revert_compscraper'
  map.output '/output', :controller => 'output_results', :action => 'output'
  map.search_items '/search_items', :controller => 'items', :action => 'search_items'
  map.edit_item '/edit_item/:id', :controller => 'items', :action => 'edit_item'
  map.update_item '/update_item/:id', :controller => 'items', :action => 'update_item'
  map.login_from_admin '/login_from_admin/:id', :controller => 'users', :action => 'login_from_admin'
  map.dashboard '/dashboard', :controller => 'users', :action => 'dashboard'
  map.resources :users

  map.resource :session

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  map.root :controller => 'sessions', :action => 'new'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
