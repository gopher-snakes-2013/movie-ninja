class SurveysController < ApplicationController

  include SessionHelper

  before_filter :current_user

  def show
    session_url
    p session
    p "I'm here"
  end

  def new
    enforce_login
    @survey = Survey.new
    @movies = Movie.all[0..20]
    @user = current_user
  end

  def create
    @survey = Survey.new
    @survey.movie_ids = params[:survey][:movie_ids]
    p @survey.movie_ids
    @survey.info = params[:survey][:info]
    @survey.save
    p @survey
    render text: "#{params}"
  end

  def confirm
    render :confirm
  end

end