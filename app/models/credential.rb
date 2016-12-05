class Credential < ActiveRecord::Base
  belongs_to :user
  validates :username, presence: true, uniqueness: true
  validate :userType_check
  validates :password, presence: true, length: {minimum: 6, maximum: 20}
  has_secure_password
  def userType_check
    if (self.userType != 'user' && self.userType != 'admin')
      errors.add(:userType, "Invalid User Type ")
    end
  end
end