class DrillGroup < ApplicationRecord
  belongs_to :user
  
  has_many :drills, dependent: :destroy

  has_many :students, through: :student_drill_groups, source: :user

  validates :name, presence: true, length: { in: 8..40 }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { minimum: 30 }
  validates :max_points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

end
