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

ActiveRecord::Schema.define(version: 20140808123311) do

  create_table "events", force: true do |t|
    t.string   "description"
    t.date     "date"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["project_id"], name: "index_events_on_project_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "stage_id"
    t.integer  "protection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "visibility"
    t.text     "feedback"
  end

  add_index "projects", ["protection_id"], name: "index_projects_on_protection_id", using: :btree
  add_index "projects", ["stage_id"], name: "index_projects_on_stage_id", using: :btree

  create_table "protections", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "full_name",              limit: 80
    t.string   "username"
    t.string   "phone"
    t.string   "rg",                     limit: 20
    t.string   "issuing_agency"
    t.date     "issuing_date"
    t.string   "cpf",                    limit: 20
    t.date     "birth_date"
    t.string   "nationality",            limit: 20
    t.string   "naturality",             limit: 20
    t.string   "residential_address",    limit: 50
    t.string   "cep",                    limit: 8
    t.string   "city",                   limit: 20
    t.string   "formation",              limit: 20
    t.string   "course",                 limit: 20
    t.string   "institution",            limit: 20
    t.string   "job",                    limit: 20
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                   default: 5,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "users_projects_profiles", id: false, force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_projects_profiles", ["profile_id"], name: "index_users_projects_profiles_on_profile_id", using: :btree
  add_index "users_projects_profiles", ["project_id"], name: "index_users_projects_profiles_on_project_id", using: :btree
  add_index "users_projects_profiles", ["user_id"], name: "index_users_projects_profiles_on_user_id", using: :btree

end
