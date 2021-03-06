Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :product_entry
      resources :batch, only: [:index, :show, :update]
      resources :stock, only: [:index, :show, :update]
    end
  end
end
