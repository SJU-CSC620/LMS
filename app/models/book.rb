class Book < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :category, presence: true, length: {minimum: 3, maximum: 20}
  validate :status_option_check
  def status_option_check
    if self.status == "--Select--"
      errors.add(:status, 'Select an option for status')
    end
  end
end