class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @survey_movie = SurveyMovie.where(survey_id: params[:survey_id], movie_id: params[:movie_id_voted_on]).first

    @vote.name = params[:voter_name]
    @vote.survey_movie_id = @survey_movie.id

    if @vote.save
      render text: "Thanks for voting bro..."
    end
  end
end