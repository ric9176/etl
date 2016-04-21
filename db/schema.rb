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

ActiveRecord::Schema.define(version: 20160420164925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_materials", force: :cascade do |t|
    t.date     "date"
    t.string   "link"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "class_materials", ["student_id"], name: "index_class_materials_on_student_id", using: :btree
  add_index "class_materials", ["teacher_id"], name: "index_class_materials_on_teacher_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "bio",        limit: 200
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.boolean  "request_status", default: false
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "relationships", ["student_id"], name: "index_relationships_on_student_id", using: :btree
  add_index "relationships", ["teacher_id"], name: "index_relationships_on_teacher_id", using: :btree

  create_table "student_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "native_language"
    t.text     "learning_objectives"
    t.integer  "student_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "student_profiles", ["student_id"], name: "index_student_profiles_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "students_teachers", force: :cascade do |t|
    t.boolean "request_status"
    t.integer "teacher_id"
    t.integer "student_id"
  end

  add_index "students_teachers", ["student_id"], name: "index_students_teachers_on_student_id", using: :btree
  add_index "students_teachers", ["teacher_id"], name: "index_students_teachers_on_teacher_id", using: :btree

  create_table "teacher_profiles", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teacher_profiles", ["teacher_id"], name: "index_teacher_profiles_on_teacher_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree
  add_index "teachers", ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true, using: :btree

  create_table "tutorings", force: :cascade do |t|
    t.boolean  "request_status", default: false
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "tutorings", ["student_id"], name: "index_tutorings_on_student_id", using: :btree
  add_index "tutorings", ["teacher_id"], name: "index_tutorings_on_teacher_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.boolean  "teacher"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "class_materials", "students"
  add_foreign_key "class_materials", "teachers"
  add_foreign_key "profiles", "users"
  add_foreign_key "relationships", "students"
  add_foreign_key "relationships", "teachers"
  add_foreign_key "student_profiles", "students"
  add_foreign_key "teacher_profiles", "teachers"
  add_foreign_key "tutorings", "students"
  add_foreign_key "tutorings", "teachers"
end
