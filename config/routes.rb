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
    post "/posts" => "posts#create"
    patch "/posts/:id" => "posts#update"
    get "/posts/:id" => "posts#show"
    # get "/posts/user/:id" => "posts#user_posts"
    delete "/posts/:id" => "posts#destroy"

    # Post State 
    get "/post/state" => "post_states#index"
    post "/post/state" => "post_states#create"
    delete "/post/state/:id" => "post_states#destroy"

    # Comments 
    get "/comments" => "comments#index"
    post "/comments" => "comments#create"
    get "/comments/:id" => "comments#show"
    patch "/comments/:id" => "comments#update"
    delete "/comments/:id" => "comments#destroy"

  end
end
