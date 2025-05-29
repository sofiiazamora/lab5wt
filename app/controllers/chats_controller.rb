class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
  end

  
  def new
    @chat = Chat.new
    @users = User.all
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to @chat
    else
      @users = User.all
      render :new
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end

  def edit
    @chat = Chat.find(params[:id])
    @users = User.all
  end

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat updated successfully"
    else
      @users = User.all
      render :edit
    end
  end

end

