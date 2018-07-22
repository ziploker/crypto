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

ActiveRecord::Schema.define(version: 2018_07_22_204403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.boolean "status"
    t.date "finish"
    t.integer "players"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_players"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "battle_id"
    t.datetime "room_winner"
    t.datetime "room_finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total"
    t.integer "balance", default: 10001
    t.index ["battle_id"], name: "index_rooms_on_battle_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "rooms_wallets", id: false, force: :cascade do |t|
    t.integer "room_id", null: false
    t.integer "wallet_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nick"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.string "abbr"
    t.string "name"
    t.decimal "quantity"
    t.decimal "paid"
    t.decimal "current_value"
    t.decimal "profit_loss"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "url"
    t.decimal "total"
  end

end
