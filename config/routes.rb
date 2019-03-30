Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root "home#index"

    get "first", to: "home#first" # ruby unique syntax
    get "second", to: "home#second" 

    get "post/ :id", to: "home#show_post"
end

