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

ActiveRecord::Schema.define(version: 20140608212834) do

  create_table "project_forms", force: true do |t|
    t.string   "project_title"
    t.text     "project_concept"
    t.string   "current_stage"
    t.string   "author"
    t.string   "employee"
    t.string   "leader"
    t.boolean  "event"
    t.string   "event_name"
    t.date     "event_date"
    t.string   "security_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "securities", force: true do |t|
    t.string   "type"
    t.integer  "project_form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "securities", ["project_form_id"], name: "index_securities_on_project_form_id", using: :btree

  create_table "stages", force: true do |t|
    t.string   "current"
    t.integer  "project_form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stages", ["project_form_id"], name: "index_stages_on_project_form_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                          default: "", null: false
    t.string   "encrypted_password",             default: "", null: false
    t.string   "full_name",           limit: 80
    t.string   "username"
    t.string   "phone"
    t.string   "rg",                  limit: 20
    t.string   "issuing_agency"
    t.date     "issuing_date"
    t.string   "cpf",                 limit: 20
    t.date     "birth_date"
    t.string   "nationality",         limit: 20
    t.string   "naturality",          limit: 20
    t.string   "residential_address", limit: 50
    t.string   "cep",                 limit: 8
    t.string   "city",                limit: 20
    t.string   "formation",           limit: 20
    t.string   "course",              limit: 20
    t.string   "institution",         limit: 20
    t.string   "job",                 limit: 20
    t.integer  "sign_in_count",                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
