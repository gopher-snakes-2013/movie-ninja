class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path, flash: { error: @user.errors.full_messages.to_sentence }
    end
  end

end