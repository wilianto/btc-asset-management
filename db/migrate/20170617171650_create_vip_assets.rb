class CreateVipAssets < ActiveRecord::Migration[5.1]
  def change
    create_table :vip_assets do |t|
      t.decimal :idr, precision: 15, scale: 5, default: 0, null: false
      t.decimal :btc, precision: 15, scale: 5, default: 0, null: false
      t.decimal :ltc, precision: 15, scale: 5, default: 0, null: false
      t.decimal :doge, precision: 15, scale: 5, default: 0, null: false
      t.decimal :xrp, precision: 15, scale: 5, default: 0, null: false
      t.decimal :drk, precision: 15, scale: 5, default: 0, null: false
      t.decimal :bts, precision: 15, scale: 5, default: 0, null: false
      t.decimal :nxt, precision: 15, scale: 5, default: 0, null: false
      t.decimal :str, precision: 15, scale: 5, default: 0, null: false
      t.decimal :nem, precision: 15, scale: 5, default: 0, null: false
      t.decimal :eth, precision: 15, scale: 5, default: 0, null: false

      t.decimal :idr_hold, precision: 15, scale: 5, default: 0, null: false
      t.decimal :btc_hold, precision: 15, scale: 5, default: 0, null: false
      t.decimal :ltc_hold, precision: 15, scale: 5, default: 0, null: false
      t.decimal :doge_hold, precision: 15, scale: 5, default: 0, null: false
      t.decimal :xrp_hold, precision: 15, scale: 5, default: 0, null: false
      t.decimal :drk_hold, precision: 15, scale: 5, default: 0, null: false
      t.decimal :bts_hold, precision: 15, scale: 5, default: 0, null: false
      t.decimal :nxt_hold, precision: 15, scale: 5, default: 0, null: false
      t.decimal :str_hold, precision: 15, scale: 5, default: 0, null: false
      t.decimal :nem_hold, precision: 15, scale: 5, default: 0, null: false
      t.decimal :eth_hold, precision: 15, scale: 5, default: 0, null: false

      t.decimal :price_btc_idr, precision: 15, scale: 5, default: 0, null: false
      t.decimal :price_ltc_btc, precision: 15, scale: 5, default: 0, null: false 
      t.decimal :price_doge_btc, precision: 15, scale: 5, default: 0, null: false
      t.decimal :price_xrp_btc, precision: 15, scale: 5, default: 0, null: false
      t.decimal :price_drk_btc, precision: 15, scale: 5, default: 0, null: false
      t.decimal :price_bts_btc, precision: 15, scale: 5, default: 0, null: false
      t.decimal :price_nxt_btc, precision: 15, scale: 5, default: 0, null: false
      t.decimal :price_str_btc, precision: 15, scale: 5, default: 0, null: false
      t.decimal :price_nem_btc, precision: 15, scale: 5, default: 0, null: false
      t.decimal :price_eth_btc, precision: 15, scale: 5, default: 0, null: false

      t.decimal :total_btc, precision: 15, scale: 5, default: 0, null: false
      t.decimal :total_idr, precision: 15, scale: 5, default: 0, null: false

      t.timestamps
    end
  end
end
