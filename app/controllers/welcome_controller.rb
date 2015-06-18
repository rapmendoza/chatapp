class WelcomeController < ApplicationController
  def index
    @session = User.new
    @message = Message.new
    @messages = Message.last(10)
    # @users = User.where("last_online_at > ?", DateTime.now.in_time_zone-5)
    if current_user
      @users = User.where(["id != ? AND last_online_at > ?", current_user.id, DateTime.now-5.minutes])
    end
  end

  # def next_messages
  #   @messages = Messages.last(15)
  # end
end

#DateTime.now.in_time_zone - User.last.last_online_at
