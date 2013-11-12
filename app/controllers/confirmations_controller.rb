class ConfirmationsController < ApplicationController
  before_filter :enforce_login

  def show  # limit view to surveys belonging to current user, for security and privacy
    @survey = current_user.surveys.find( params[:survey_id] )  # survey_id comes from nested/parent route
    if @survey.nil?
      flash[:error] = "You don't have a survey at that location"
      redirect_to root_path
    end
  end

end
