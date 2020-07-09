Rails.application.routes.draw do
  post "/login", to: "user_token#create"
  get "/status", to: "status#index"
  get "/status/user", to: "status#user"
end
