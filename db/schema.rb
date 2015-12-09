# encoding: UTF-8
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


ActiveRecord::Schema.define(version: 20151202005535) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "course_id"
    t.string   "name"
    t.string   "grades"
    t.integer  "points"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "allDay"
    t.string   "title"
  end

  add_index "assignments", ["course_id"], name: "index_assignments_on_course_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "year_restrictions"
    t.string   "course_number"
    t.string   "description"
    t.integer  "assignment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester_hours"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "user_id"
    t.string   "password_digest"
    t.string   "role"
    t.string   "year"
    t.integer  "assignment_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token"
    t.boolean  "ta"
    t.string   "name"
  end

  add_index "users", ["user_id"], name: "index_users_on_user_id", unique: true

end
