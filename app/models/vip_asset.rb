class VipAsset < ApplicationRecord
  before_save :calculate_total

  def calculate_total
    calculate_total_btc
    calculate_total_idr
  end

  private
  def calculate_total_btc
    self.total_btc = self.btc + self.btc_hold
    self.total_btc += (self.idr + self.idr_hold) / self.price_btc_idr
    ["ltc", "doge", "xrp", "drk", "bts", "nxt", "str", "nem", "eth"].each do |currency|
      total_currency = attributes[currency] + attributes["#{currency}_hold"]
      rate = attributes["price_#{currency}_btc"] 
      self.total_btc += total_currency * rate / 100_000_000
    end
  end

  def calculate_total_idr
    self.total_idr = self.total_btc * self.price_btc_idr
  end
end
