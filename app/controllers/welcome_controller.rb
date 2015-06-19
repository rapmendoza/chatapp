class WelcomeController < ApplicationController
  def index
    @session = User.new
    @message = Message.new
    @messages = Message.last(10)
    if current_user
      @users = User.where(["id != ? AND last_online_at > ?", current_user.id, DateTime.now-5.minutes])
    end
  end
end
