class StudentDrillGroup < ApplicationRecord
  belongs_to :user
  belongs_to :drill_group


  validates :points_rewarded, {
    numericality: { only_integer: true }
  }

  validates :score, {
    numericality: { only_integer: true,
    less_than_or_equal_to: 100
    }
  }

end
