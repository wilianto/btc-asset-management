class PagesController < ApplicationController
  def preview
    @vip_asset = VipAsset.new vip_asset_params
  end

  private
  def vip_asset_params
    prices = VipApi.get_current_price
    assets = VipApi.get_asset
    prices.merge!(assets).select!{ |key, price| VipAsset.column_names.include?(key.to_s) }
    return prices
  end
end