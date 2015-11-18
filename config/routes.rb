Rails.application.routes.draw do
  resources :users
  resources :courses
  root 'users#index'
  resources :sessions, only: [:new, :create, :destroy]
  match '/login', to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: :delete
  match '/home', to: 'users#home', via: :get
  match '/admin_home', to: 'users#admin_home', via: :get
  match '/view_students', to: 'users#view_students', via: :get
  match '/assignments_home', to: 'assignments#assignments_home', via: :get
  match '/assignments_home', to: 'assignments#createAssignment', via: :post
  match '/deleteAssignment', to: 'assignments#deleteAssignment', via: :post
  match '/updateAssignment', to: 'assignments#updateAssignment', via: :post
  resources :events
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
