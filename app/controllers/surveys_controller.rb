class SurveysController < ApplicationController

  include SessionHelper

  before_filter :current_user

  # before_filter :enforce_login, :except => :show

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
    enforce_login
    p "i'm here"
    @survey = current_user.surveys.new
    @survey.info = params[:survey][:info]
    # @survey.user = current_user
    @survey.movie_ids = params[:survey][:movie_ids]
    if @survey.save
      render :text => "#{@survey.movie_ids}"
    else
      flash[:error] = "Error creating survey"
      redirect_to root_path
    end


    # render :text => "#{@survey}"

    # current_user.surveys.build( )
    # if @survey.save
    #   redirect_to survey_confirmation_path( @survey )
    # else
    #   @survey.nil?
    #   flash[:error] = "You do not have a valid survey"
    # end

    # jointable.create(movieId,surveyId)
    # # @current_user.survey = Survey.new
    # @current_user.survey.movie_ids = params[:survey][:movie_ids]
    # p @current_user.survey.movie_ids
    # @survey.info = params[:survey][:info]
    # @survey.save
    # p @survey
    # respond_to do |format|
    #   format.js {
    #     render js: "alert( '#{params}' );"
    #   }
  end

  def show
    @survey = Survey.find( params[:survey_url] )
    render :confirm
  end

end