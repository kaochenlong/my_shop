Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root "products#index"

  resources :products, only: [:index, :show]

  namespace :admin, path: Settings.admin_path do
    resources :products
  end
end
