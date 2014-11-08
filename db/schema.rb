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

ActiveRecord::Schema.define(version: 20141106123107) do

  create_table "academics", force: true do |t|
    t.integer  "user_id",                                                null: false
    t.integer  "tenth_rollno",                                           null: false
    t.decimal  "tenth_marks",    precision: 10, scale: 2, default: 40.0, null: false
    t.integer  "tenth_year",                                             null: false
    t.string   "tenth_board",                                            null: false
    t.string   "twelfth_stream",                                         null: false
    t.integer  "twelfth_rollno",                                         null: false
    t.decimal  "twelfth_marks",  precision: 10, scale: 2, default: 40.0, null: false
    t.integer  "twelfth_year",                                           null: false
    t.string   "twelfth_board",                                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: true do |t|
    t.integer  "personal_id"
    t.string   "address_line1", null: false
    t.string   "address_line2"
    t.string   "town_vill",     null: false
    t.string   "district",      null: false
    t.string   "state",         null: false
    t.integer  "pin",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
  end

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "personals", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name",    default: "", null: false
    t.string   "last_name",     default: "", null: false
    t.date     "date_of_birth",              null: false
    t.string   "mothers_name",  default: "", null: false
    t.string   "fathers_name",  default: "", null: false
    t.string   "gender",                     null: false
    t.string   "category",      default: "", null: false
    t.string   "mobile_no",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  create_table "stream_selectors", force: true do |t|
    t.integer  "user_id"
    t.integer  "stream_id"
    t.integer  "calculated_marks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verified",         default: false
  end

  create_table "streams", force: true do |t|
    t.string   "name"
    t.integer  "GEN"
    t.integer  "SC"
    t.integer  "ST"
    t.integer  "OBC_A"
    t.integer  "OBC_B"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_str_maps", force: true do |t|
    t.integer  "stream_id"
    t.integer  "subject_id"
    t.integer  "GEN"
    t.integer  "SC"
    t.integer  "ST"
    t.integer  "OBC_A"
    t.integer  "OBC_B"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sub_str_maps", ["stream_id", "subject_id"], name: "index_sub_str_maps_on_stream_id_and_subject_id", unique: true, using: :btree

  create_table "subject_entries", force: true do |t|
    t.integer  "academic_id"
    t.integer  "subject_id"
    t.integer  "marks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subject_entries", ["academic_id", "subject_id"], name: "index_subject_entries_on_academic_id_and_subject_id", unique: true, using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tstream",    default: "Others", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verifier",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
