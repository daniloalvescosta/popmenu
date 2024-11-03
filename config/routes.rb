Rails.application.routes.draw do
  root "restaurants#index"
  resources :restaurants
  resources :menu_items
  resources :menus

  post '/data_imports', to: 'data_imports#create'
end
