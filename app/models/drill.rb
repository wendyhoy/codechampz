class Drill < ApplicationRecord
  SOLUTIONS_COUNT_MIN = 1

  belongs_to :drill_group

  has_many :solutions, dependent: :destroy, inverse_of: :drill
  has_many :student_drills, dependent: :destroy

  validates :question, presence: true, uniqueness: { scope: :drill_group, case_sensitive: false }

  validate :check_solutions_number, on: [:update, :create]

  accepts_nested_attributes_for :solutions, allow_destroy: true

  private

  def solutions_count_valid?
    solutions.reject(&:marked_for_destruction?).count >= SOLUTIONS_COUNT_MIN
  end

  def check_solutions_number
    unless solutions_count_valid?
      errors.add(:solutions, 'Must have at least one solution to this drill')
    end
  end

end
