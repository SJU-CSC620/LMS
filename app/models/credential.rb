class Credential < ActiveRecord::Base
  belongs_to :user
  validates :email, presence: true
  validates :userType, presence: true, length: {minimum: 6, maximum: 20}
end