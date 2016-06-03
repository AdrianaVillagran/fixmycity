class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:role, :username, :current_city, :password, :password_confirmation, :email)
  end

end
