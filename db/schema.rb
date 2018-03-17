# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180317191849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drill_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "level"
    t.integer "max_points"
    t.bigint "user_id"
    t.string "badge_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_drill_groups_on_user_id"
  end

  create_table "drills", force: :cascade do |t|
    t.text "question"
    t.bigint "drill_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_group_id"], name: "index_drills_on_drill_group_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.text "solution"
    t.bigint "drill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_id"], name: "index_solutions_on_drill_id"
  end

  create_table "student_drill_groups", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "drill_group_id"
    t.integer "points_awarded", default: 0
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_group_id"], name: "index_student_drill_groups_on_drill_group_id"
    t.index ["user_id"], name: "index_student_drill_groups_on_user_id"
  end

  create_table "student_drills", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "drill_id"
    t.boolean "is_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drill_id"], name: "index_student_drills_on_drill_id"
    t.index ["user_id"], name: "index_student_drills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "drill_groups", "users"
  add_foreign_key "drills", "drill_groups"
  add_foreign_key "solutions", "drills"
  add_foreign_key "student_drill_groups", "drill_groups"
  add_foreign_key "student_drill_groups", "users"
  add_foreign_key "student_drills", "drills"
  add_foreign_key "student_drills", "users"
end
