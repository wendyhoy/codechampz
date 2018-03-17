class CreateDrillGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :drill_groups do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.integer :max_points
      t.references :user, foreign_key: true
      t.string :badge_name

      t.timestamps
    end
  end
end
