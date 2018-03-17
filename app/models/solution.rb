class Solution < ApplicationRecord
  belongs_to :drill

  validates :solution, presence: true

end
