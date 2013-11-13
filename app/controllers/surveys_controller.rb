class SurveysController < ApplicationController

  include SessionHelper

  before_filter :enforce_login, except: [:show]

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
    @survey.first_available_datetime = params[:survey][:first_available_datetime]
    if @survey.save
      redirect_to survey_path(@survey.url)
    else
      flash[:error] = "Error creating survey"
      redirect_to root_path
    end
  end

  def show
    @survey = Survey.find_by_url(params[:survey_url])
    if current_user == @survey.user
      @movie_list = @survey.movies
      @votes = {}
      @survey.survey_movies.each do |sm|
        @votes[sm.movie_id] = sm.votes.length
      end
      @votes_names = {}
      @survey.survey_movies.each do |sm|
        @votes_names[sm.movie_id] = []

      end
      render :survey_confirmation
    else
      @user = User.new
      @movies = @survey.movies
      render :show
    end
  end
end