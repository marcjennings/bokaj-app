Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user_registrations"}
 
  resources :products do
    resources :comments
    # GET /products/:product_id/comments/new ===> views/comments/new.html.erb
  end
  resources :users

  # Resources for Orders
  resources :orders, only: [:index, :show, :create, :destroy]


  # Login and Logout parameters
  # devise_for :users :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  get 'static_pages/race'

  get 'static_pages/about' # ? when we do not specify the controller and action, Rails decides
                           # by parsing the URL. <controller>/<action>

  get 'static_pages/contact'

  post 'static_pages/thank_you'

  get 'static_pages/login'

  get 'static_pages/review'

  get 'comments/index'

  post 'payments/create'
  get  'payments/order_done'

  get '/passwords/edit'




  #get 'static_pages/index'
  get 'races/:market_name', to: 'products#show', as: :product_market_name
  get 'races', to: "static_pages#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home' # if request is GET "/" then handle the 
                            # request with "static_pages" controller and action "index"

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
