class Patient < ActiveRecord::Base

    BLOOD_TYPE_OPTIONS = [
    ["O-", "O-"],
    ["O+", "O+"],
    ["A-", "A-"],
    ["A+", "A+"],
    ["B-", "B-"],
    ["B+", "B+"],
    ["AB-", "AB-"],
    ["AB+", "AB+"],
  ]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :description, presence: true
  validates :gender, presence: true
  validates :blood_type, presence: true
  validate  :at_least_10

  def at_least_10
    if self.dob
      errors.add(:dob, ' : You must be at least 10') if self.dob > 10.years.ago.to_date
    end
  end

end
