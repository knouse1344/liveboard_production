Lbdevelopmentv03::Application.routes.draw do

  #get "guestlist/add"

  #get "guestlist/remove"

  #get "billboard/index"

  get "organization_fliers/add"

  get "organization_fliers/delete"

  resources :organizations

  get "realtime/subscription"

  get "realtime/verify"

  get "realtime/change"

  get "error_pages/not_friends"

  get "error_pages/friend_not_found"

  get "error_pages/not_your_flier"

  get "friends/display"

  get "channels/index"

  get "myboard/index"

  get "fliers/index"

  get "fliers/show"

  get "fliers/new"
  post "fliers/edit"

  get "fliers/edit"

  get "fliers/update"

  post "fliers/destroy"

  post "fliers/create"

  get "myfliers/invite"

  post "myfliers/send_invite"
  resources :users
  resources :fliers
  resources :invitations

  get "invitations/new"
  post "invitations/store_token"
  post "invitations/create"
 
  
  get "liveboard/index"

  get "users/create"

  get "users/update"

  get "users/show"

  get "users/destroy"

  get "pages/welcome"

  get "pages/contact"

  get "pages/about"

  get "pages/press"

  post "facebook_update/create"

  match 'login', to: 'auth/facebook'
  match 'logout', to: 'sessions#destroy'
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: 'pages#welcome'
  match 'liveboard', to: 'liveboard#index', as: 'liveboard'
  match 'community_select', to: 'users#community_select'
  match 'myboard', to: 'myboard#index'
  match 'liveboard', to: 'liveboard#index'
  match 'myboard_add_flier', to: 'Myfliers#add'
  match 'myboard_delete_flier', to: 'Myfliers#delete'
  match 'contact', to: 'pages#contact'
  match 'help', to: 'pages#help'
  match 'about', to: 'pages#about'
  match 'facebook_update', to: 'facebook_updates#create', as: 'facebookupdates'
  

  #organizations
  match 'sessions_org_create', to: 'sessions#org_create'
  match 'sessions_redirect', to: 'sessions#registration_redirect'
  match 'org_logout', to: 'sessions#org_destroy'
  match 'create_organization', to: 'organizations#register'

  #channels matches
  match 'channels/academics', to: "channels#index", :channel_id => "1"
  match 'channels/arts', to: "channels#index", :channel_id => "2"
  match 'channels/misc', to: "channels#index", :channel_id => "3"
  match 'channels/nightlife', to: "channels#index", :channel_id => "4"
  match 'channels/sports', to: "channels#index", :channel_id => "5"

  #friends match
  match 'friends/:id', to: "friends#display"

  #errors match
  match 'not_friends', to: "error_pages#not_friends"
  match 'user_not_found', to: "error_pages#friend_not_found"
  match 'cant_view_flier', to: "error_pages#cant_view_flier"

  #flier action matches
  match 'create_flier', to: 'fliers#new'
  match 'show_flier', to: 'fliers#show'
  match 'invite', to: 'myfliers#invite'
  match 'edit_flier', to: 'fliers#edit'
  
  #organization_flier action matches
  match 'org_add_flier', to: 'organization_fliers#add'
  match 'org_delete_flier', to: 'organization_fliers#delete'

  #invitation matches
  match 'new_invitation', to: 'invitations#new'
  match 'send_invitation', to: 'invitations#create'
  match 'check_token', to: 'invitations#store_token'



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
  root :to => 'pages#welcome'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

 
end
