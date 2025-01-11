Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "notes#index"

  resources :notes do
    member do
      patch :toggle_pin
    end
  end
end

