class SessionsController < ApplicationController

  include SessionHelper

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render text: "#{params}, #{@user}"
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end