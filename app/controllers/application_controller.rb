class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize

    if !current_user || !current_user.admin?
      flash[:alert] = "Whoops, you are not an admin!"
      redirect_to '/'
    end

  end

  include SessionsHelper
end
