Rtr4c::Application.routes.draw do

  get 'dashboard', to: 'dashboard#index'
  get "purchases/index"
  get 'static/about'
  get 'static/contribute'
  get 'static/contact'
  get 'static/projects'
  get 'static/news'
  get 'static/dashboard'
  get 'contribute/location'
  get 'static/ind_projects'

  get 'login',  to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'store',  to: 'products#index',   as: 'store'
  get 'contact',to: 'contacts#new',     as: 'contact'
  get 'contribute/online', to: 'donations#new',     as: 'contribute/online'
  get 'donate', to: 'static#donate', as: 'donate'

  post '/add_to_cart/:product_id' => 'cart#add_to_cart', :as => 'add_to_cart'
  post '/delete_from_cart/:product_id' => 'cart#delete_from_cart', :as => 'delete_from_cart' 
  post '/update_cart/' => 'cart#update_cart', :as => 'update_cart'
  
  root 'welcome#index'

  resources :projects
  resources :sessions
  resources :users, except: [:new, :create]
  resources :updates
  resources :press_updates
  resources :news
  resources :blogposts
  resources :products, :path => "store"
  resources :charges
  resources :donors
  resources :donations do 
    collection do
      get 'confirm'
    end
  end
  resources :cart
  resources :team_members, :path => "about"
  resources :checkouts do 
    collection do
      get 'confirm'
    end
  end
  resources :purchases
  resources :contribute, :path => "volunteer"
  resources :contacts, :path => "contact"

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
