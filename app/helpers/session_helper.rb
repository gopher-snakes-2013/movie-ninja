module SessionHelper

  def logout
    session.clear
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if signed_in?
  end

  def signed_in?
    session[:user_id] ? true : false
  end

  def destroy
    logout
  end

end
