module Admin
  class MessagesController < ApplicationController
    before_filter :require_admin

    def index
      @messages = Message.all
    end

    def show
      @message = Message.find(params[:id])
    end

    private

    def require_admin
      redirect_to root_path if current_user.nil? || !current_user.is_admin
    end
  end
end
