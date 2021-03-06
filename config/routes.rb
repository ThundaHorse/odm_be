Rails.application.routes.draw do
  namespace :api do 
    # Users 
    get "/users" => "user#index"
    post "/users" => "user#create"
    get "/users/:id" => "user#show"
    get "/posts/user/:id" => "user#user_posts"
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
    post "/post/state/:post_id" => "post_states#create"
    get "/post/state/:id" => "post_states#show"
    patch "/post/upvote/:id" => "post_states#upvote"
    patch "/post/downvote/:id" => "post_states#downvote"
    delete "/post/state/:id" => "post_states#destroy"

    # Comments 
    get "/comments" => "comments#index"
    get "/comments/post/:post_id" => "comments#post_comments"
    post "/comments" => "comments#create"
    get "/comments/:id" => "comments#show"
    patch "/comments/:id" => "comments#update"
    patch "/comments/upvote/:id" => "comments#upvote"
    patch "/comments/downvote/:id" => "comments#downvote"
    delete "/comments/:id" => "comments#destroy"

  end
end
