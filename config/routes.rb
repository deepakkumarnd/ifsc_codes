Rails.application.routes.draw do
  resources :banks
  resources :cities
  resources :districts
  resources :states
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
