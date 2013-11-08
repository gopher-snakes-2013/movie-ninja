class Movie < ActiveRecord::Base
  attr_accessible :title, :rotten_id, :imdb_id, :mob_poster_url, :det_poster_url, :rt_critics_score, :rt_audience_score, :mpaa_rating, :synopsis, :runtime
  validates :title, presence: :true
end