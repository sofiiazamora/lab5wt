class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:chat, :user).all
  end

  def show
    @message = Message.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to messages_path, alert: "Message not found"
  end

  def new
    @message = Message.new
    @chats = Chat.all
    @users = User.all
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to @message
    else
      @chats = Chat.all
      @users = User.all
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :chat_id, :user_id)
  end
end


