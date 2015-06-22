Alertsmall::Application.routes.draw do
  devise_for :users
  get "sessions/new"
  get "sessions/create"
  get "sessions/failure"

  resources :tweets, :except => :update
  match '/admin', :to => 'tweets#index', :via => [:get]
  match '/tweets/admin_approve' => 'tweets#admin_approve', :as =>'admin_approve', :via => [:patch]
  match '/admins/hit_impressions' => 'admins#hit_impressions', :as =>'impressions', :via => [:get]
  match '/admins/blocked_users' => 'admins#blocked_users', :as =>'banned', :via => [:get]
  match '/admins/user_scores' => 'admins#user_scores', :as =>'user_scores', :via => [:get]
  match '/admins/block' => 'admins#block', :via => [:post]
  match '/tweets/connect_users' => 'tweets#connect_users', :as=>'connectingyou', :via => [:post]
  match '/tweets/critiquking_reckoner' => 'tweets#critiquking_reckoner', :via => [:post]
  get '/auth/failure'=> 'tweets#new'
  get 'auth/:provider/callback' => 'tweets#new'



  root :to => "tweets#new"

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
