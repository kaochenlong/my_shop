Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  resources :products, only: [:index, :show]

  namespace :admin, path: Settings.admin_path do
    resources :products
  end
end
