class MoviesController < ApplicationController
  def index
  end

  def show
    @movie = Movie.find(params[:movie_id])
    render :json => render_to_string(:partial => 'movie-preview', locals: {movie: @movie }).to_json
  end
end