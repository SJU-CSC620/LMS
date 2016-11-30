class Credential < ActiveRecord::Base
  belongs_to :user
  validates :username, presence: true, uniqueness: true
  validates :userType, presence: true, length: {minimum: 3, maximum: 20}
  validates :password, presence: true, length: {minimum: 6, maximum: 20}
  has_secure_password
end