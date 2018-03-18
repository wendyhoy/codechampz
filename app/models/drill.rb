class Drill < ApplicationRecord
  belongs_to :drill_group

  has_many :solutions, dependent: :destroy

  validates :question, presence: true, uniqueness: { scope: :drill_group, case_sensitive: false }

  accepts_nested_attributes_for :solutions, allow_destroy: true

end
