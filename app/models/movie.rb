class Movie < ActiveRecord::Base
  attr_accessible :title, :rotten_id, :imdb_id, :mob_poster_url, :det_poster_url, :rt_critics_score, :rt_audience_score, :mpaa_rating, :synopsis, :runtime, :release_date

  validates :title, presence: :true

  has_many :survey_movies
  has_many :showtimes
  has_many :surveys, through: :survey_movies
end
