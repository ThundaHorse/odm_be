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

  def destroy 
    @post_state = PostState.find(params[:id])
    @post_state.delete
    render json: { message: "Deleted" }
  end 

end
