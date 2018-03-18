class DrillGroup < ApplicationRecord
  belongs_to :user

  has_many :drills, dependent: :destroy

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
    length: { minimum: 30 }

  validates :max_points,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }


  def friendly_level

    if level == 1
      'Beginner'
    elsif level == 2
      'Intermediate'
    elsif level == 3
      'Advanced'
    end
  end

end
