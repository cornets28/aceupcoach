# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_21_160350) do
  create_table "appointments", force: :cascade do |t|
    t.integer "coach_instructor_id", null: false
    t.integer "user_id", null: false
    t.datetime "appointment_start_date"
    t.integer "duration"
    t.string "location"
    t.string "coach_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_instructor_id"], name: "index_appointments_on_coach_instructor_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "coach_instructors", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "phone_number"
    t.integer "years_of_experience"
    t.string "picture"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "username"
    t.string "phone_number"
    t.string "email"
    t.string "address"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "coach_instructors"
  add_foreign_key "appointments", "users"
end
