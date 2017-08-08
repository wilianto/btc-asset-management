class AssetCalculator
  def self.is_change? old_vip_asset, new_vip_asset
    %w{idr btc bch ltc doge xrp drk bts nxt str nem eth}.each do |currency|
      old_currency = self.count_total old_vip_asset, currency
      new_currency = self.count_total new_vip_asset, currency
      return true unless (new_currency - old_currency).round(2) == 0.00
    end
    return false
  end

  def self.compare old_vip_asset, new_vip_asset
    result = {}
    %w{idr btc bch ltc doge xrp drk bts nxt str nem eth}.each do |currency|
      old_currency = self.count_total old_vip_asset, currency
      new_currency = self.count_total new_vip_asset, currency
      diff = (new_currency - old_currency).round(2)
      result[currency.to_sym] = diff unless diff == 0.0
    end
    return result
  end

  private
  def self.count_total obj, currency
    return 0 if obj.nil?
    obj.attributes[currency].to_f + obj.attributes["#{currency}_hold"].to_f
  end
end