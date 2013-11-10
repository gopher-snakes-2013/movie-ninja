class SurveysController < ApplicationController

  include SessionHelper

  before_filter :current_user

  def show
    p params
    @survey_path = params[:survey_url]
    p survey_path
  end

  def new
    @survey = Survey.new
    @movies = Movie.first(21)
    @user = current_user
  end

end