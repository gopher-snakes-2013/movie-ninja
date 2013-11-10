class Showtime < ActiveRecord::Base
  attr_accessible :title, :tms_id, :mpaa_rating, :release_year, :theater_name, :theater_id, :theater_showtime
  belongs_to :movie
  validates :title, presence: :true
end
