Rails.application.routes.draw do
  root "home#index"

  get "/login", to: "login#index"
  post "/login/submit", to: "login#submit"
  get "/register", to: "register#index"
  post "/register/submit", to: "register#submit"
  get "/account", to: "account#index"
  post "/admin/edit_site", to: "account#editSite"
  post "/account/logout", to: "account#logout"
  # post "/register/submit", to: "register#registrationSubmit"
  # resources :registration_form, only: %i[new registrationSubmit]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
