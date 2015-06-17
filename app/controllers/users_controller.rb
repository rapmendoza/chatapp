class UsersController < ApplicationController
  before_filter :require_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def dashboard
  end

  private

  def require_user
    redirect_to root_path if current_user.nil?
  end
end
