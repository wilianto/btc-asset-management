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

ActiveRecord::Schema.define(version: 20170921043148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "vip_assets", force: :cascade do |t|
    t.decimal "idr", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "ltc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "doge", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "xrp", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "drk", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "bts", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "nxt", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "str", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "nem", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "eth", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "idr_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "btc_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "ltc_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "doge_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "xrp_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "drk_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "bts_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "nxt_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "str_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "nem_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "eth_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_btc_idr", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_ltc_btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_doge_btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_xrp_btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_drk_btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_bts_btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_nxt_btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_str_btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_nem_btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_eth_btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "total_btc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "total_idr", precision: 15, scale: 5, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "bch", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "bch_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_bch_idr", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "etc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "etc_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_etc_idr", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_eth_idr", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "xzc", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "xzc_hold", precision: 15, scale: 5, default: "0.0", null: false
    t.decimal "price_xzc_idr", precision: 15, scale: 5, default: "0.0", null: false
  end

end
