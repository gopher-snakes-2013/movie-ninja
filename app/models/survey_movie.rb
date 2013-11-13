class SurveyMovie < ActiveRecord::Base
  has_many :votes
  belongs_to :survey
  belongs_to :movie

end
