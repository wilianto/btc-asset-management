class PingController < ApplicationController
  def index
    old_vip_asset = VipAsset.last
    vip_asset = VipAsset.new vip_asset_params

    if vip_asset.save
      if AssetCalculator.is_change? old_vip_asset, vip_asset
        SlackApi.send_notif "`#{AssetCalculator.compare(old_vip_asset, vip_asset).to_json}`"
      end
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
