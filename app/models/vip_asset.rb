class VipAsset < ApplicationRecord
  before_save :calculate_total
  after_initialize :calculate_total

  def calculate_total
    calculate_total_btc
    calculate_total_idr
  end

  def percentage currency
    ratio = attributes[currency] + attributes["#{currency}_hold"]

    if currency != "idr"
      if currency == "bch"
        ratio *= attributes["price_bch_idr"]
      elsif currency == "etc"
        ratio *= attributes["price_etc_idr"]
      elsif currency == "xzc"
        ratio *= attributes["price_xzc_idr"]
      elsif currency == "btc"
        ratio *= attributes["price_btc_idr"]
      else
        ratio *= attributes["price_btc_idr"]
        ratio *= attributes["price_#{currency}_btc"] / 100_000_000
      end
    end

    if calculate_total_idr != 0
      percentage = ratio / calculate_total_idr * 100
      return percentage.round(2)
    else
      return 0.0
    end
  end

  def count_idr_eth_btc_idr
    total = 1_000_000 / price_eth_idr * (price_eth_btc / 100_000_000.0) * price_btc_idr
    margin = total.nan? ? 0 : (total - 1_000_000).round(2)
    return margin
  end

  def count_idr_btc_eth_idr
    total = 1_000_000 / price_btc_idr / (price_eth_btc / 100_000_000.0) * price_eth_idr
    margin = total.nan? ? 0 : (total - 1_000_000).round(2)
    return margin
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
    self.total_idr += (self.bch + self.bch_hold) * self.price_bch_idr
    self.total_idr += (self.etc + self.etc_hold) * self.price_etc_idr
    self.total_idr += (self.xzc + self.xzc_hold) * self.price_xzc_idr
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
