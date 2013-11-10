class UsersController < ApplicationController

  include SessionHelper

  def index
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path, flash: { error: @user.errors.full_messages.to_sentence }
    end
  end

  def preview_user
    @user = current_user
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

end