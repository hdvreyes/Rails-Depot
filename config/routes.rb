Rails.application.routes.draw do
  get 'admin/index'
  # Admin routes
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  # get 'store/index'
  resources :products do
    get :who_bought, on: :member
    # get :about_product
    collection do
      get :about_product
    end
  end

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as:'store_index', via: :all
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
