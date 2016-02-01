class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include ApplicationHelper

  def login!(user)
    session[:session_token] = user.reset_session_token!
    current_user = user
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_login
    redirect_to new_session_url unless is_logged_in
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
