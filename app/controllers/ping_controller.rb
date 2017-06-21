class PingController < ApplicationController
  def index
    vip_asset = VipAsset.new vip_asset_params

    if vip_asset.save
      render body: nil, status: :ok
    end
  end

  private
  def vip_asset_params
    prices = VipApi.get_current_price
    assets = VipApi.get_asset
    prices.merge! assets
  end
end
