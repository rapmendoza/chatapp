class WelcomeController < ApplicationController
  def index
    @session = User.new
    @message = Message.new
    @messages = Message.last(10)
    @users = User.all
  end

  # def next_messages
  #   @messages = Messages.last(15)
  # end
end
