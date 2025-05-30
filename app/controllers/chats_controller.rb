class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @chats = Chat.accessible_by(current_ability)
  end


  def show
  end

  def new
    @users = User.all
  end

  def create
    if @chat.save
      redirect_to @chat
    else
      @users = User.all
      render :new
    end
  end

  def edit
    @users = User.all
  end

  def update
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat updated successfully"
    else
      @users = User.all
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
