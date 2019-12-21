class Api::CommentsController < ApplicationController

  def index 
    @comments = Comment.all 
    render "index.json.jbuilder"
  end 

  def show 
    @comment = Comment.find(params[:id])
    render "show.json.jbuilder"
  end 

  def create 
    @comment = Comment.new({
      post_id: params[:post_id],
      title: params[:title],
      body: params[:body]
    })

    if @comment.save 
      render "show.json.jbuilder"
    else 
      render json: { message: @comment.errors.full_messages }
    end 
  end 

  def update 
    @comment = Comment.find(params[:id])
    @comment.title = params[:title] || @comment.title
    @comment.body = params[:body] || @comment.body
  end

  def destroy 
    @comment = Commend.find(params[:id])
    @comment.delete 
    render json: { message: "Deleted comment successfully" }
  end 

end
