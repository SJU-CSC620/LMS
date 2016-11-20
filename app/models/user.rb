class User < ActiveRecord::Base
  has_one :credential
  before_save{self.email=email.downcase}
  validates :fname, presence: true, 
            length: {minimum: 3, maximum: 20, }
  validates :lname, presence: true, 
            length: {minimum: 3, maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5, maximum: 25}
end