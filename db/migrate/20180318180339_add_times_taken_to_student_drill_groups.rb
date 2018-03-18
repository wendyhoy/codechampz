class AddTimesTakenToStudentDrillGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :student_drill_groups, :times_taken, :integer, default: 0
  end
end
