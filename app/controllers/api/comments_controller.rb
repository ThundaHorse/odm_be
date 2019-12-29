class Api::CommentsController < ApplicationController
  before_action :authenticate_user
  def index 
    @comments = Comment.all.order("id")    
    render "index.json.jbuilder"
  end 

  def show 
    @comment = Comment.find(params[:id])
    render "show.json.jbuilder"
  end

  def post_comments
    @comments = Comment.where(post_id: params[:post_id]).order("id")
    render "index.json.jbuilder"
  end 

  def create 
    @comment = Comment.new({
      user: current_user.first_name, 
      post_id: params[:post_id],   
      body: params[:body]
    })

    if @comment.save 
      render "show.json.jbuilder"
    else 
      render json: { message: @comment.errors.full_messages }
    end 
  end 

  def upvote     
    @comment = Comment.find(params[:id])
    @comment.likes += 1
    @comment.save    
    render "show.json.jbuilder"
  end 

  def downvote
    @comment = Comment.find(params[:id])
    @comment.dislikes += 1
    @comment.save    
    render "show.json.jbuilder"
  end 

  def update 
    @comment = Comment.find(params[:id])    
    @comment.body = params[:body] || @comment.body
    
    if @comment.save
      render "show.json.jbuilder"
    else 
      render json: { message: @comment.errors.full_messages }
    end
  end

  def destroy 
    @comment = Commend.find(params[:id])
    @comment.delete 
    render json: { message: "Deleted comment successfully" }
  end 

end
