class User < ApplicationRecord
# general

  has_secure_password

# admin
  has_many :drill_groups, dependent: :nullify

# students
  has_many :student_drill_groups, dependent: :nullify

  has_many :student_drills, dependent: :nullify

# validations

  validates :first_name, :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email,
    presence: true,
    uniqueness: true,
    format: VALID_EMAIL_REGEX



    def full_name
    "#{first_name} #{last_name}".strip
  end

end
