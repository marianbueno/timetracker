Timetracker::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  namespace :admin do
    resources :companies
  end

  resource  :session

  resources :users do
    collection do
      get 'activity'
    end
  end

  resources :jobs do
    collection do
      get 'activity'
    end
  end

  resources :labors do
    member do
      get  'toggle_end'
      post 'finish'
    end
    collection do
      get  'week'
      get  'month'
      get  'period'
      post 'show_stories'
    end
  end


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
  match 'about' => "home#about"
  root :to => "home#index"

  match 'login'  => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'signup' => 'users#new', :as => :signup
  match 'activate/:activation_code' => 'users#activate', :as => :activate, :activation_code => nil

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
