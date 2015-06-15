class RegisterController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created."
      redirect_to root_url
    else
      render :index
    end
  end

  def user_params
    params.require(:user).permit!
  end
end
