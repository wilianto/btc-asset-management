class PagesController < ApplicationController
  def preview
    response.headers["Access-Control-Allow-Origin"] = "vip.wilianto.com"
    @vip_asset = VipAsset.new vip_asset_params
  end

  private
  def vip_asset_params
    prices = VipApi.get_current_price
    assets = VipApi.get_asset
    prices.merge! assets
  end
end