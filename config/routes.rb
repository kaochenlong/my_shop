Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root "products#index"

  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :create]

  namespace :admin, path: Settings.admin_path do
    resources :products
    resources :orders
  end

  resource :cart, only:[:show, :destroy] do
    member do
      post :add, path: 'add/:id'
      get :checkout
    end
  end
end
