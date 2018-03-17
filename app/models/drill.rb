class Drill < ApplicationRecord
  belongs_to :drill_group
  has_many :solutions

  validates :question, presence: true

end
