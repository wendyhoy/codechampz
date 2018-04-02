class Drill < ApplicationRecord
  MIN_SOLUTIONS_COUNT = 1

  belongs_to :drill_group

  has_many :solutions, dependent: :destroy
  has_many :student_drills, dependent: :destroy

  validates :question, presence: true, uniqueness: { scope: :drill_group, case_sensitive: false }

  validate :has_min_solutions, on: [:update, :create]

  accepts_nested_attributes_for :solutions, allow_destroy: true

  private

  def has_min_solutions
    if solutions.reject(&:marked_for_destruction?).count < MIN_SOLUTIONS_COUNT
      errors.add(:drills, 'must have at least one solution.')
    end
  end

end
