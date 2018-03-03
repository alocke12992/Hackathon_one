class usersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = current_user.users
  end

  def show
  end

  def new
    @user = user.new
  end

  def edit
  end

  def create
    @user = current_user.users.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def udpate
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      #don't just users user.find(params[:id]) or you would be able to view
      #others users
      @user = current_user.users.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :balance)
    end
end
