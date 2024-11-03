Rails.application.routes.draw do
  root "restaurants#index"
  resources :restaurants
  resources :menu_items
  resources :menus

  get "up" => "rails/health#show", as: :rails_health_check
end
