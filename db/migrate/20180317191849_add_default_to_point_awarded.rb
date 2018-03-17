class AddDefaultToPointAwarded < ActiveRecord::Migration[5.1]
  def change
    change_column :student_drill_groups, :points_awarded, :integer, :default => 0
  end
end
