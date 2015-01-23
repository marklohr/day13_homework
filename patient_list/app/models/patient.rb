class Patient < ActiveRecord::Base

has_many :medications, dependent: :destroy
belongs_to :doctor



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

  

end
