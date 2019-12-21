class Api::PostsController < ApplicationController  
  def index
    @posts = Post.all.order("created_at DESC")
    render 'index.json.jbuilder'
  end

  def show
    @post = Post.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update 
    @post = Post.find(params[:id])
    @post.description = params[:description] || @post.description
    @post.image = params[:image] || @post.image

    if @post.save 
      render json: { message: 'Successfully updated!' }
    else
      render json: { errors: @post.errors.full_messages }
    end
  end 

  def create
    post = Post.new(
      description: params[:description],
      user_id: params[:user_id],
      image: params[:image]
    )

    if post.save
      render json: { message: 'Post created successfully', post_id: post.id, description: post.description }
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy 
    @post = Post.find(params[:id])
    @post.delete
    render json: { message: "Successfully deleted post" }
  end 
end
