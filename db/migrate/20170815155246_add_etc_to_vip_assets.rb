class AddEtcToVipAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :vip_assets, :etc, :decimal, precision: 15, scale: 5, default: 0, null: false
    add_column :vip_assets, :etc_hold, :decimal, precision: 15, scale: 5, default: 0, null: false
    add_column :vip_assets, :price_etc_idr, :decimal, precision: 15, scale: 5, default: 0, null: false
    add_column :vip_assets, :price_eth_idr, :decimal, precision: 15, scale: 5, default: 0, null: false
  end
end
