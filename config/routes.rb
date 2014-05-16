SongMenu::Application.routes.draw do
  get "bills/new"
  get "tables/new"
  get "items/new"
  # get "bill/new"
  # get "bill/show"
  # get "courses/create"
  # get "courses/destroy"
  # get "courses/edit"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :restaurants, only: [:create, :destroy, :show] do
    resources :courses
    resources :tables do
      resources :bills
    end
    resources :bills
  end
  resources :tables, only: [:create, :destroy, :show]
  resources :bills do
    resources :items
  end
  resources :items
  resources :courses
  # resources :courses
  # resources :restaurants do
  #   resources :courses
  # end
  root 'common#home'
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/help', to: 'common#help', via: 'get'
  match '/contact', to: 'common#contact', via: 'get'
  match '/about', to: 'common#about', via: 'get'
  # get "common/home"
  # get "common/help"
  # get "common/contact"
  # get "common/about"
  # get "users/new"
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
