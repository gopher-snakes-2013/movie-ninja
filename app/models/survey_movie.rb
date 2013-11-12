class SurveyMovie < ActiveRecord::Base

  belongs_to :survey
  belongs_to :movie

end
