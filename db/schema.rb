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

ActiveRecord::Schema.define(version: 20180205185656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frames", force: :cascade do |t|
    t.bigint "turn_id"
    t.bigint "member_id"
    t.integer "ball1"
    t.integer "ball2"
    t.integer "ball3"
    t.integer "score"
    t.boolean "isfinal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_frames_on_member_id"
    t.index ["turn_id"], name: "index_frames_on_turn_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_members_on_team_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_in_rounds", force: :cascade do |t|
    t.bigint "round_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_team_in_rounds_on_round_id"
    t.index ["team_id"], name: "index_team_in_rounds_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turns", force: :cascade do |t|
    t.integer "number"
    t.bigint "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_turns_on_round_id"
  end

  add_foreign_key "frames", "members"
  add_foreign_key "frames", "turns"
  add_foreign_key "members", "teams"
  add_foreign_key "team_in_rounds", "rounds"
  add_foreign_key "team_in_rounds", "teams"
  add_foreign_key "turns", "rounds"
end
