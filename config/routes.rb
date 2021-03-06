Rails.application.routes.draw do
  resources :events
  resources :users
  resources :courses
  resources :grades
  resources :assignments
  root 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  match '/login', to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: :delete
  match '/home', to: 'users#home', via: :get
  match '/admin_home', to: 'users#admin_home', via: :get
  match '/admin_view_professors', to: 'users#admin_view_professors', via: :get
  match '/view_students', to: 'users#view_students', via: :get
  match '/assignments_home', to: 'assignments#assignments_home', via: :get
  match '/assignments_home', to: 'assignments#assignments_home', via: :post
  match '/createAssignment', to: 'assignments#createAssignment', via: :post
  match '/deleteAssignment', to: 'assignments#deleteAssignment', via: :post
  match '/updateAssignment', to: 'assignments#updateAssignment', via: :post
  match '/:course_id/:assignment_id/grades', to: 'grades#index', via: :get
  match '/:course_id/:assignment_id/grades/add', to: 'grades#create', via: :post
  match '/student_info', to: 'users#student_info', via: :get
  match '/promote_TA', to: 'users#promote_TA', via: :post
  match '/demote_TA', to: 'users#demote_TA', via: :post
  match '/enroll', to: 'courses#enroll', via: :post
  
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
