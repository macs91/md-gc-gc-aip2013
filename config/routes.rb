MdGcGcAip2013::Application.routes.draw do
  get "services/supports"

  get "services/all_services"

  get "services/admin_page"

  get "products/add_service_to_product"

  get "products/choose_service"

  get "products/admin_page"

  get "products/choose_product"

  get "products/choose_photo_and_product"

  post "products/add_photo_to_product"

  post "products/add_service_to_product"

  get "products/add_photo_to_product"

  get "products/our_products_by_category_room"
  get "designers/admin_page"

  get 'products/our_products_by_category_room'

  get 'products/our_categories_by_room'

  resources :abouts


  resources :partners do
    member do
      get 'all_partners'
    end
  end
  resources :categories

  resources :groups


  resources :rooms


  get 'products/technical_details'

  get 'group/entry'

  get 'group/show'

  get 'products/our_rooms'

  get 'products/all_partners'

  get 'products/products_by_category_by_room_by_partner'

  get 'products/categories_by_room_by_partner'

  get 'products/rooms_by_partner'

  get 'products/top_design'

  resources :services

  resources :groups

  resources :products

  # it should work!
  resources :designers do
    member do
      get 'designed'
      get 'management_page'
    end
  end

  get 'admin/index'

  get 'home/index'

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
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
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
  #       get 'recent', :on => :collection
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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
