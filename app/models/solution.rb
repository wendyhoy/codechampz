class Solution < ApplicationRecord
  belongs_to :drill

  validates :solution, presence: true, uniqueness: { scope: :drill, case_sensitive: false }
end
