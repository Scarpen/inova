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

ActiveRecord::Schema.define(version: 20140516135719) do

  create_table "users", force: true do |t|
    t.string   "email",                          default: "", null: false
    t.string   "encrypted_password",             default: "", null: false
    t.string   "full_name",           limit: 80,              null: false
    t.string   "user_name",                                   null: false
    t.string   "phone_number",                                null: false
    t.string   "rg",                  limit: 20,              null: false
    t.string   "issuing_agency",                              null: false
    t.date     "issuing_date",                                null: false
    t.string   "cpf",                 limit: 20,              null: false
    t.date     "birth_date",                                  null: false
    t.string   "nationality",         limit: 20,              null: false
    t.string   "naturality",          limit: 20,              null: false
    t.string   "residential_address", limit: 50,              null: false
    t.string   "cep",                 limit: 8,               null: false
    t.string   "city",                limit: 20,              null: false
    t.string   "formation",           limit: 20,              null: false
    t.string   "course",              limit: 20,              null: false
    t.string   "institution",         limit: 20,              null: false
    t.string   "profession",          limit: 20,              null: false
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
