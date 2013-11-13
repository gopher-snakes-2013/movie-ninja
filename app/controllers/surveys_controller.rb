class SurveysController < ApplicationController

  include SessionHelper

  before_filter :enforce_login

  def new
    enforce_login
    @survey = Survey.new
    @movies = Movie.where(release_status: 'wide').sample(21)
    @user = current_user
  end

  def create
    enforce_login
    @survey = current_user.surveys.new
    @survey.info = params[:survey][:info]
    @survey.movie_ids = params[:survey][:movie_ids]
    if @survey.save
      redirect_to survey_path(@survey.url)
    else
      flash[:error] = "Error creating survey"
      redirect_to root_path
    end
  end

  def show
    @survey = Survey.find_by_url(params[:survey_url])
    @movie_list = @survey.movies
    @survey_id = @survey.id

    if current_user == @survey.user
      render 'show'
    else
      render 'survey_visitor'
    end
  end
end