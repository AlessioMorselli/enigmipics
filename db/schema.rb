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

ActiveRecord::Schema.define(version: 20180620075838) do

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "saved_pictures", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "picture_id"
    t.bigint "board_id"
    t.index ["board_id"], name: "index_saved_pictures_on_board_id"
    t.index ["picture_id"], name: "index_saved_pictures_on_picture_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "picture_id"
    t.index ["picture_id"], name: "index_votes_on_picture_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "boards", "users"
  add_foreign_key "pictures", "users"
  add_foreign_key "saved_pictures", "boards"
  add_foreign_key "saved_pictures", "pictures"
  add_foreign_key "votes", "pictures"
  add_foreign_key "votes", "users"
end
