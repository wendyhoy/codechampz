class DrillGroup < ApplicationRecord
  belongs_to :user

  has_many :drills, dependent: :destroy
  has_many :student_drill_groups, dependent: :nullify
  has_many :students, through: :student_drill_groups, source: :user

  validates :level,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 3
    }

  validates :name,
    presence: true,
    length: { in: 8..40 },
    uniqueness: { case_sensitive: false, scope: :level }

  validates :description,
    presence: true,
    length: { minimum: 10 }

  validates :max_points,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_save :capitalize_name
  
  def friendly_level
    level_names = [ nil, 'Beginner', 'Intermediate', 'Advanced' ]
    level_names[level]
  end

  def capitalize_name
    name.capitalize!
  end

  # override helper method to return drills ordered by created_at
  def drills
    Drill.where(drill_group_id: self.id).order(created_at: :asc)
  end
end
