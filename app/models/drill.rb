class Drill < ApplicationRecord
  belongs_to :drill_group
  has_many :solutions

  validates :question, presence: true, uniqueness: { scope: :drill_group, case_sensitive: false }

end
