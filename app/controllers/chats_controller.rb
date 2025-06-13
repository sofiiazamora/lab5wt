class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @chats = Chat.accessible_by(current_ability)
  end

  def show
  end

  def new
    @chat = Chat.new
    @users = User.where.not(id: current_user.id)
  end

  def create
    @chat.sender = current_user
    if @chat.save
      redirect_to @chat
    else
      @users = User.where.not(id: current_user.id)
      render :new
    end
  end


  def edit
    @users = User.where.not(id: current_user.id)
  end

  def update
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat updated successfully"
    else
      @users = User.where.not(id: current_user.id)
      render :edit
    end
  end

  def destroy
    @chat.destroy
    redirect_to chats_path, notice: "Chat deleted successfully"
  end

  private

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end
end

