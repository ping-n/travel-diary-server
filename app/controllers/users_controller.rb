class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: "user created", status: :created
    else
      render json: user.errors.full_messages, status: :failed
    end
  end

  def update 
    if user_params[:email] == ''
      current_user.password = user_params[:password]
    else
      current_user.email = user_params[:email]
    end
    render json: current_user.email, status: :ok if current_user.save
  end

  private 
  def user_params 
    params.require(:user).permit(:email, :password)
  end 
end
