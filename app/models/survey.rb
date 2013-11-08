class Survey < ActiveRecord::Base
  attr_accessible :user_id, :survey_url, :survey_info, :first_available_datetime, :last_available_datetime, :location_info, :zipcode

  before_save :generate_survey_url

  def generate_survey_url
    self.survey_url = SecureRandom.urlsafe_base64
  end
end