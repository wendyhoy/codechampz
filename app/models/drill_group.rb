class DrillGroup < ApplicationRecord
  belongs_to :user
  has_many :drills
  has_many :students, through: :student_drill_groups, source: :user
end
