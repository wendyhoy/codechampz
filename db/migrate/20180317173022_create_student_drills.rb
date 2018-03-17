class CreateStudentDrills < ActiveRecord::Migration[5.1]
  def change
    create_table :student_drills do |t|
      t.references :user, foreign_key: true
      t.references :drill, foreign_key: true
      t.boolean :is_correct

      t.timestamps
    end
  end
end
