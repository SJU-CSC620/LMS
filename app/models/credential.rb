class Credential < ActiveRecord::Base
  validates :loginId, presence: true, length: {minimum: 5, maximum: 15}
  validates :password, presence: true, length: {minimum: 6, maximum: 20}
end