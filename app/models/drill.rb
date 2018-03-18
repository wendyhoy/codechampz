class Drill < ApplicationRecord
  belongs_to :drill_group

  has_many :solutions, dependent: :destroy
  has_many :student_drills, dependent: :destroy

  validates :question, presence: true, uniqueness: { scope: :drill_group, case_sensitive: false }

end
