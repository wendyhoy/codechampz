class StudentDrillGroup < ApplicationRecord
  belongs_to :user
  belongs_to :drill_group
end
