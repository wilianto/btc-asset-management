class AddBtgToVipAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :vip_assets, :btg, :decimal, precision: 15, scale: 5, default: 0, null: false
    add_column :vip_assets, :btg_hold, :decimal, precision: 15, scale: 5, default: 0, null: false
    add_column :vip_assets, :price_btg_idr, :decimal, precision: 15, scale: 5, default: 0, null: false
  end
end
