class User < ApplicationRecord
# admin
  has_many :drill_groups


# students
  has_many :student_drill_groups

  has_many :student_drills
end
