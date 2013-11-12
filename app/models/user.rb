class User < ActiveRecord::Base
  has_many :surveys

  attr_accessible :email, :password

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }

  def is_creator_of?(object)
    return true if object.respond_to? :user_id && object.user_id == self.id
    false
  end
end
