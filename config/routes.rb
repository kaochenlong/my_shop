Rails.application.routes.draw do
  root "products#index"

  resources :products, only: [:index, :show]

  namespace :admin, path: Settings.admin_path do
    resources :products
  end
end
