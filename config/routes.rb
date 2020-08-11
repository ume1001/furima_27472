Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users
  resources :items do
    get 'purchase_confirmation'
    post 'purchase', on: :member
  end
end
