class UsersController < ApplicationController

  include SessionHelper

  def index
    @user = current_user || User.new
    if current_user
      redirect_to new_survey_path
    end
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to new_survey_path
    else
      redirect_to root_path, flash: { error: @user.errors.full_messages.to_sentence }
    end
  end
end