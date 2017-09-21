class AddXzcToVipAssets < ActiveRecord::Migration[5.1]
  def change
    add_column :vip_assets, :xzc, :decimal, precision: 15, scale: 5, default: 0, null: false
    add_column :vip_assets, :xzc_hold, :decimal, precision: 15, scale: 5, default: 0, null: false
    add_column :vip_assets, :price_xzc_idr, :decimal, precision: 15, scale: 5, default: 0, null: false
  end
end
