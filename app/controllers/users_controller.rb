class UsersController < ApplicationController
  before_action :new_report
  def new
  end

  def create
    @user = User.create(user_params)
    p @user.role
    redirect_to user_path(@user)
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def new_report
    @report = Report.new
  end

  def user_params
    params.require(:user).permit(:role, :username, :current_city, :password, :password_confirmation, :email)
  end

end
