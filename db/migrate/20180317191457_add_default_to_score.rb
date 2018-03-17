class AddDefaultToScore < ActiveRecord::Migration[5.1]
  def change
    change_column :student_drill_groups, :score, :integer, :default => 0
  end
end
