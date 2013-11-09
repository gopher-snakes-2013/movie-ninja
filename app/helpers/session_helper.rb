module SessionHelper

  def logout
    session.clear
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if signed_in?
  end

  def signed_in?
    session[:current_user_id] ? true : false
  end

  def destroy
    logout
  end

end
