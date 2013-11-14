class VotesController < ApplicationController

  def create
    @user = User.new

    @vote = Vote.new
    @survey_movie = SurveyMovie.where(survey_id: params[:survey_id], movie_id: params[:movie_id_voted_on]).first

    @vote.name = params[:voter_name]
    @vote.survey_movie_id = @survey_movie.id
    @movie = @vote.survey_movie.movie

    if @vote.save
      render 'confirmation'
    end
  end
end