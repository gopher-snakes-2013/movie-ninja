class SurveyMovies < ActiveRecord::Base

  belongs_to :survey
  belongs_to :movie


end