class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html do
          redirect_to root_url
        end

        format.json do
          render :json => @message, :include => :user
        end
      end
    else
      render :index
    end
  end

  def message_params
    params.require(:message).permit!
  end

  def check
    if params[:id] != Message.last.id.to_s
      @new_messages = Message.where("id > ?", params[:id])
      render :json => @new_messages, :include => :user
    else
      render :json => ""
    end
  end

  def more
    @more_messages = Message.last(params[:count])
    render :json => @more_messages, :include => :user
    # render :text => params[:count]
  end
end
