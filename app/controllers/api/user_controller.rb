class Api::UserController < ApplicationController
  before_action :authenticate_user
  skip_before_action :authenticate_user, only: [:create, :show]

  def index 
    @users = User.all
    render "index.json.jbuilder"
  end 

  def show 
    @user = User.find(params[:id])
    render "show.json.jbuilder"
  end 

  def user_posts 
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    render :partial => "posts/show.json.jbuilder"
  end 

  def update 
    @user = User.find(params[:id])
    @user.first_name = params[:first_name] || @user.first_name 
    @user.last_name = params[:last_name] || @user.last_name 
    @user.phone_number = params[:phone_number] || @user.phone_number
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation

    if @user.save 
      render json: { message: "Updated successfully" }
    else 
      render json: { errors: user.errors.full_messages }
    end 
  end 

  def create 
    @user = User.new(
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    phone_number: params[:phone_number],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )
    # if @user.validate_phone(@user.phone_number) && @user.save 
    if @user.save
      render json: { message: "User created successfully" }, status: 200
    else 
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end 
  end 

  def destroy 
    @user = User.find(params[:id])
    verification = {
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    }

    if verification[:password] === @user.password && verification[:password_confirmation] === @user.password_confirmation
      @user.delete 
      render json: { message: "User deleted successfully" }
    else 
      render json: { errors: @user.errors.full_messages }
    end 
  end 

end
