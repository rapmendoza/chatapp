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

  def check
    @user = User.where(:id => current_user.id).first
    @user.update_attributes(:last_online_at => DateTime.now.in_time_zone)
    # @users = User.where("last_online_at > ?", DateTime.now.in_time_zone-5)
    @users = User.where(["id != ? AND last_online_at > ?", current_user.id, DateTime.now.in_time_zone-5])
    render :json => @users
    # if params[:id] != Message.last.id.to_s
    #   @new_messages = Message.where("id > ?", params[:id])
    #   render :json => @new_messages, :include => :user
    # else
    #   render :json => ""
    # end
  end

  private

  def require_user
    redirect_to root_path if current_user.nil?
  end
end

#User.last.update(:is_admin => true)
