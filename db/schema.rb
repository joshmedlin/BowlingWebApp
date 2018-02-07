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

ActiveRecord::Schema.define(version: 20180207195640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members_in_teams", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_members_in_teams_on_member_id"
    t.index ["team_id"], name: "index_members_in_teams_on_team_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_rounds_on_day_id"
  end

  create_table "scores", force: :cascade do |t|
    t.bigint "round_id"
    t.bigint "member_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_scores_on_member_id"
    t.index ["round_id"], name: "index_scores_on_round_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams_in_days", force: :cascade do |t|
    t.bigint "day_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_teams_in_days_on_day_id"
    t.index ["team_id"], name: "index_teams_in_days_on_team_id"
  end

  add_foreign_key "members_in_teams", "members"
  add_foreign_key "members_in_teams", "teams"
  add_foreign_key "rounds", "days"
  add_foreign_key "scores", "members"
  add_foreign_key "scores", "rounds"
  add_foreign_key "teams_in_days", "days"
  add_foreign_key "teams_in_days", "teams"
end
