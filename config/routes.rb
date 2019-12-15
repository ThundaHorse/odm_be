Rails.application.routes.draw do
  namespace :api do 
    # Users 
    get "/users" => "user#index"
    post "/users" => "user#create"
    get "/users/:id" => "user#show"
    patch "/users/:id" => "user#update"
    delete "/users/:id" => "user#destroy"

    # Sessions 
    post "/sessions" => "sessions#create"

    # Posts 
    get "/posts" => "posts#index"
    get "/posts/:id" => "posts#show"
    post "/posts" => "posts#create"
  end 
end
