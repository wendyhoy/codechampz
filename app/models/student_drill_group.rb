class StudentDrillGroup < ApplicationRecord
  belongs_to :user
  belongs_to :drill_group

  validates :points_awarded, {
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
    }
  }

  validates :score, {
    numericality: { 
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100
    }
  }



end
