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

ActiveRecord::Schema.define(version: 20160603001040) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "confirmed_issues", force: :cascade do |t|
    t.string   "title"
    t.string   "notes"
    t.integer  "category"
    t.integer  "danger_level"
    t.integer  "status"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "major_road"
    t.string   "cross_street1"
    t.string   "cross_street2"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "confirmed_issues_reports", id: false, force: :cascade do |t|
    t.integer "confirmed_issue_id", null: false
    t.integer "report_id",          null: false
  end

  add_index "confirmed_issues_reports", ["confirmed_issue_id", "report_id"], name: "idx_confirmed_issue_report", using: :btree
  add_index "confirmed_issues_reports", ["report_id", "confirmed_issue_id"], name: "idx_report_confirmed_issue", using: :btree

  create_table "reports", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "category"
    t.string   "major_road"
    t.string   "cross_street1"
    t.string   "cross_street2"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "upvotes"
    t.integer  "downvotes"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "status",        default: 0
    t.integer  "danger_level"
    t.string   "address"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "current_city"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
