class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    authorize! :read, User
    if current_user.admin?
      @users = User.all
    else
      redirect_to chats_path, alert: "Access denied."
    end
  end


  def show
    # @user cargado y autorizado
  end

  def new
    # @user inicializado y autorizado
  end

  def create
    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @user cargado y autorizado
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User deleted successfully"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end

