class AddBchToVipAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :vip_assets, :bch, :decimal, precision: 15, scale: 5, default: 0, null: false
    add_column :vip_assets, :bch_hold, :decimal, precision: 15, scale: 5, default: 0, null: false
    add_column :vip_assets, :price_bch_idr, :decimal, precision: 15, scale: 5, default: 0, null: false
  end
end
