class SessionController < ApplicationController
  def create
    user = User.where({:username => params[:user][:username]}).first
    if user && user.password == params[:user][:password]
      session[:user_id] = user.id
      flash[:notice] = "Succesfully signed in."
      redirect_to root_path
    else
      flash[:error] = "Invalid username/password."
      redirect_to root_path
    end
  end

  def delete
    session[:user_id] = nil
    flash[:notice] = "Succesfully logged out."
    redirect_to root_path
  end
end
