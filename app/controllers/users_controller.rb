class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)

    login(@user)
    if @user.save
        redirect_to @user
    else render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:role, :username, :current_city, :password,
                                 :password_confirmation, :email)
  end

end
