class VipAsset < ApplicationRecord
  before_save :calculate_total

  def calculate_total
    calculate_total_btc
    calculate_total_idr
  end

  private
  def calculate_total_btc
    if self.price_btc_idr != 0
      self.total_btc = (self.idr + self.idr_hold) / self.price_btc_idr
    end
    self.total_btc += self.btc + self.btc_hold + calculate_total_other()
  end

  def calculate_total_idr
    rate_idr = attributes["price_btc_idr"] 
    self.total_idr = (self.btc + self.btc_hold) * self.price_btc_idr
    self.total_idr += self.idr + self.idr_hold + calculate_total_other(rate_idr)
  end

  def calculate_total_other(rate_idr = 1)
    total_all = 0
    ["ltc", "doge", "xrp", "drk", "bts", "nxt", "str", "nem", "eth"].each do |currency|
      total_currency = attributes[currency] + attributes["#{currency}_hold"]
      rate_btc = attributes["price_#{currency}_btc"] 
      total_all += total_currency * rate_btc * rate_idr / 100_000_000
    end
    return total_all.infinite? ? 0 : total_all
  end
end
