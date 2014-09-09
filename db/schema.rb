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

ActiveRecord::Schema.define(version: 20140909090946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "misses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "distance"
    t.datetime "time"
    t.integer  "user_id"
    t.integer  "neighbour_id"
  end

  add_index "misses", ["neighbour_id"], name: "index_misses_on_neighbour_id", using: :btree
  add_index "misses", ["user_id"], name: "index_misses_on_user_id", using: :btree

  create_table "oauth_credentials", force: true do |t|
    t.string   "type"
    t.string   "uid"
    t.string   "token"
    t.string   "refresh_token"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "storylines", force: true do |t|
    t.integer  "user_id"
    t.date     "story_date"
    t.json     "moves_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
  end

end
