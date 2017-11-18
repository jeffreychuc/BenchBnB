class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def login(user)
    @current_user = user
    session[:session_token] = current_user.session_token
  end

  def logout
    self.reset_session_token
    session[:session_token] = nil
    redirect_to api_new_session_url
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

end
