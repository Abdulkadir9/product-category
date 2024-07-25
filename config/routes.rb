Rails.application.routes.draw do
  root "homes#index"
  resources :homes
  resources :products
  resources :categories
end
