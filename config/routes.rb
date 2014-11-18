Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/mixanimata'
  get 'home/software'
  get 'home/uphresies'
  get 'home/epikoinonia'
  post 'home/epikoinonia_send'
  get 'home/analosima'
  get 'home/analosima_lipantika'
  get 'home/analosima_router'
  post 'home/analosima_router_send'
  post 'home/card'
  get 'home/kalathi'
  delete 'home/destroy'
  put 'home/update'
  get 'home/paraggelia'
  post 'home/paraggelia_send'
  get 'home/pdf'
  get 'home/admin'
  post 'home/admin_send'
  post 'home/import'
  get 'home/export'
  get 'home/faq'
  root 'home#index'
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
