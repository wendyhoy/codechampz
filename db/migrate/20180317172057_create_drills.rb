class CreateDrills < ActiveRecord::Migration[5.1]
  def change
    create_table :drills do |t|
      t.text :question
      t.references :drill_group, foreign_key: true

      t.timestamps
    end
  end
end
