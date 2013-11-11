class Showtime < ActiveRecord::Base
  attr_accessible :oc_title, :tms_id, :mpaa_rating, :release_year, :theater_name, :theater_id, :theater_showtime

  belongs_to :movie

  fuzzily_searchable :oc_title

  validates :oc_title, presence: :true
end
