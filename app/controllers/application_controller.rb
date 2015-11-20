class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protected
  def set_current_user
    @current_user ||= User.find_by_session_token(cookies[:session_token])
    redirect_to login_path unless @current_user
  end  
  
  def current_user?(id)
    @current_user.id.to_s == id
  end
  
  def logged_in?
    if User.find_by_session_token(cookies[:session_token])
      return true
    else
      return false
    end
  end
end
