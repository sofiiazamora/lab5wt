class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    # @messages ya cargado y autorizado por load_and_authorize_resource
    # Includes para optimizar queries (si querés lo mantenemos)
    @messages = @messages.includes(:chat, :user)
  end

  def show
    # @message cargado y autorizado
  rescue ActiveRecord::RecordNotFound
    redirect_to messages_path, alert: "Message not found"
  end

  def new
    # @message inicializado y autorizado
    @chats = Chat.all
    @users = User.all
  end

  def create
    # @message inicializado con message_params y autorizado
    if @message.save
      redirect_to @message
    else
      @chats = Chat.all
      @users = User.all
      render :new
    end
  end

  def edit
    # @message cargado y autorizado
    @chats = Chat.all
    @users = User.all
  end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: "Message updated successfully"
    else
      @chats = Chat.all
      @users = User.all
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path, notice: "Message deleted successfully"
  end

  private

  def message_params
    params.require(:message).permit(:body, :chat_id, :user_id)
  end
end
