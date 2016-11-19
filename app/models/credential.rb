class Credential < ActiveRecord::Base
  belongs_to :user
  validates :email, presence: true
  validates :userType, presence: true, length: {minimum: 3, maximum: 20}
  has_secure_password
end