class SurveysController < ApplicationController
  def show
    p params
    @survey_path = params[:survey_url]
    p survey_path
  end

  def new
    @survey = Survey.new
  end

end