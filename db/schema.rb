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

ActiveRecord::Schema.define(version: 20170309035358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faves", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "zwipp_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "faves", ["user_id", "zwipp_id"], name: "index_faves_on_user_id_and_zwipp_id", unique: true, using: :btree
  add_index "faves", ["user_id"], name: "index_faves_on_user_id", using: :btree
  add_index "faves", ["zwipp_id"], name: "index_faves_on_zwipp_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "follower_id", null: false
    t.integer  "followee_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "follows", ["followee_id"], name: "index_follows_on_followee_id", using: :btree
  add_index "follows", ["follower_id", "followee_id"], name: "index_follows_on_follower_id_and_followee_id", unique: true, using: :btree
  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 24
    t.string   "email"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "zwipps", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "text",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "zwipps", ["user_id"], name: "index_zwipps_on_user_id", using: :btree

  add_foreign_key "faves", "users"
  add_foreign_key "faves", "zwipps"
  add_foreign_key "follows", "users", column: "followee_id"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "zwipps", "users"
end
