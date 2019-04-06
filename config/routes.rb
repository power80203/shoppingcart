Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "products#index"

  resources :products

  get "admin/log_in", to: "admin#log_in"
  get "admin/log_out", to: "admin#log_out"


end