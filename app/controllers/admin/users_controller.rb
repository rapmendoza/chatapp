module Admin
  class UsersController < ApplicationController
    before_filter :require_admin

    def index
      @users = User.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to admin_users_path
      else
        render 'edit'
      end
    end

    def user_params
      params.require(:user).permit!
    end

    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "User deletion succesful."
      redirect_to admin_users_path
    end

    private

    def require_admin
      redirect_to root_path if current_user.nil? || !current_user.is_admin
    end
  end
end
