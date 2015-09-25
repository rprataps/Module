Rails.application.routes.draw do
  get 'sessions/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'hours'    => 'static_pages#hours'
  get 'faq'    => 'static_pages#faq'
  get 'signup'  => 'users#new'
  get 'new_admin'  => 'users#new_admin'
  get 'profile'  => 'users#profile'
  get 'admins'  => 'users#admin_index'
  get 'manage_admin'  => 'users#manage_admin'
  get 'manage_book'  => 'users#manage_book'
  get 'manage_member'  => 'users#manage_member'
  get    'login'   => 'sessions#new'
  get    'admin_login'   => 'sessions#admin_login'
  post   'login'   => 'sessions#create'
  post   'admin_login'   => 'sessions#create'
#  post '/users/:id' => 'users#show'
  delete 'logout'  => 'sessions#destroy'
  get 'admin' => 'users#admin_page'
  post 'checkout' =>  'checkout#checkout_book'
  get 'search_books' => 'books#search'
  resources :users
  resources :books

  resources :users do
  get :view_profile, on: :member
  end

  resources :books do
  get :view, on: :member
  end

  resources :books do
    get :show_book_history, on: :member
  end

  resources :users do
    get :Show_history, on: :member
  end

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
