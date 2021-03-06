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

ActiveRecord::Schema.define(version: 2021_09_15_032405) do

  create_table "favorites", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_favorites_on_order_id"
    t.index ["student_id"], name: "index_favorites_on_student_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "requester_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_likes_on_order_id"
    t.index ["requester_id"], name: "index_likes_on_requester_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "requester_id"
    t.integer "student_id"
    t.text "content"
    t.string "image"
    t.integer "messages_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["messages_id"], name: "index_messages_on_messages_id"
    t.index ["requester_id"], name: "index_messages_on_requester_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["student_id"], name: "index_messages_on_student_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "requester_id"
    t.string "place"
    t.datetime "datefrom"
    t.datetime "dateto"
    t.integer "people"
    t.string "job"
  end

  create_table "requesters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_requesters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_requesters_on_reset_password_token", unique: true
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "requester_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requester_id"], name: "index_rooms_on_requester_id"
    t.index ["student_id"], name: "index_rooms_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "orders"
  add_foreign_key "favorites", "students"
  add_foreign_key "likes", "orders"
  add_foreign_key "likes", "requesters"
  add_foreign_key "messages", "messages", column: "messages_id"
  add_foreign_key "messages", "requesters"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "students"
  add_foreign_key "rooms", "requesters"
  add_foreign_key "rooms", "students"
end
