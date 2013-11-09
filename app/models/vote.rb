class Vote < ActiveRecord::Base
  attr_accessible :name

  belongs_to :survey_movie

  validates :name, presence: :true
end