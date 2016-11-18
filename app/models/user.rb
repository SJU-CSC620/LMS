class User < ActiveRecord::Base
  validates :fname, presence: true, length: {minimum: 3, maximum: 20}
  validates :lname, presence: true, length: {minimum: 3, maximum: 20}
  validates :email, presence: true, length: {minimum: 3, maximum: 20}
  #validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5, maximum: 15}
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 5, maximum: 15}
end