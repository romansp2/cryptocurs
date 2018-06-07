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

ActiveRecord::Schema.define(version: 20180605170323) do

  create_table "currencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code"
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pair_candles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code"
    t.bigint "mts"
    t.decimal "open", precision: 10
    t.decimal "close", precision: 10
    t.decimal "high", precision: 10
    t.decimal "low", precision: 10
    t.decimal "volume", precision: 10
    t.integer "pair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pairs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code"
    t.float "bid", limit: 24
    t.float "bid_size", limit: 24
    t.float "ask", limit: 24
    t.float "ask_size", limit: 24
    t.float "daily_change", limit: 24
    t.float "daily_change_perc", limit: 24
    t.float "last_price", limit: 24
    t.float "volume", limit: 24
    t.float "high", limit: 24
    t.float "low", limit: 24
    t.integer "currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nickname"
    t.string "password"
    t.string "email"
    t.string "name"
    t.string "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wallets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "private_key"
    t.string "public_key"
    t.string "address"
    t.integer "user_id"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
