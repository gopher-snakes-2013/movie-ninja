module SessionHelper

  def logout
    session.clear
    @user = nil
  end

  def current_user
    @user ||= User.find(session[:current_user_id]) if signed_in?
  end

  def signed_in?
    session[:current_user_id] ? true : false
  end

  def enforce_login
    if !signed_in?
      redirect_to root_path
      flash[:error] = "You must be logged in to access that page."
    end
  end
end
