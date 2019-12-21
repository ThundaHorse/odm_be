class Api::PostStatesController < ApplicationController

  def index 
    @post_states = PostState.all
    render "index.json.jbuilder"
  end

  def create 
    @post_state = PostState.create(
      post_id: params[:post_id]
    )
    @post_state.save 
    render "show.json.jbuilder"
  end 

  def upvote 
    @post_state = PostState.find(params[:id])
    @post_state.likes += 1
    @post_state.save
    render json: { message: "Upvoted" }
  end 

  def downvote
    @post_state = PostState.find(params[:id])
    @post_state.dislikes += 1
    @post_state.save
    render json: { message: "Downvoted" }
  end 

  def destroy 
    @post_state = PostState.find(params[:id])
    @post_state.delete
    render json: { message: "Deleted" }
  end 

end
