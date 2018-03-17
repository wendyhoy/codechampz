class CreateStudentDrillGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :student_drill_groups do |t|
      t.references :user, foreign_key: true
      t.references :drill_group, foreign_key: true
      t.integer :points_awarded
      t.integer :score

      t.timestamps
    end
  end
end
