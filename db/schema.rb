# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_09_21_170100) do
  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.time "end_time"
    t.date "reservation_date"
    t.string "reserver_name"
    t.integer "room_id", null: false
    t.time "start_time"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["room_id"], name: "index_reservations_on_room_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.integer "site_id", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_rooms_on_site_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "reservations", "rooms"
  add_foreign_key "reservations", "users"
  add_foreign_key "rooms", "sites"
end
