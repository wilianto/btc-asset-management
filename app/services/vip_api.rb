class VipApi
  include HTTParty

  def self.get_current_price
    response_obj = get ENV["CURRENT_PRICE_URL"]
    body = JSON.parse response_obj.body
    body_price = body["prices"]
    prices = {
      price_btc_idr: body_price["btcidr"].to_i,
      price_bch_idr: body_price["bchidr"].to_i,
      price_ltc_btc: body_price["ltcbtc"].to_i,
      price_doge_btc: body_price["dogebtc"].to_i,
      price_xrp_btc: body_price["xrpbtc"].to_i,
      price_drk_btc: body_price["drkbtc"].to_i,
      price_bts_btc: body_price["btsbtc"].to_i,
      price_nxt_btc: body_price["nxtbtc"].to_i,
      price_str_btc: body_price["strbtc"].to_i,
      price_nem_btc: body_price["nembtc"].to_i,
      price_eth_btc: body_price["ethbtc"].to_i,
    }
    return prices
  end

  def self.get_asset
    request_data = self.generate_data("getInfo")
    response_obj = self.request_api request_data
    body = JSON.parse response_obj.body

    if body["success"] == 1
      body_balance = body["return"]["balance"]
      body_balance_hold = body["return"]["balance_hold"]
      balances = {}
      body_balance.each{|currency, balance| balances[currency.to_sym] = balance.to_f }
      body_balance_hold.each{|currency, balance| balances[(currency + "_hold").to_sym] = balance.to_f }
      return balances
    else
      Rails.logger.error "[VIP_ERROR_GETINFO] #{body['error']}"
    end
  end

  def self.get_sign key, data
    hmac_hash = OpenSSL::HMAC.hexdigest("SHA512", key, data)
    return hmac_hash
  end

  private
  def self.request_api data
    post ENV["BASE_API_URL"], {
      headers: {
        "Sign" => self.get_sign(ENV["VIP_SECRET"], data),
        "Key" => ENV["VIP_KEY"],
        "Content-Type" => "application/x-www-form-urlencoded"
      },
      body: data
    }
  end

  def self.generate_data method_name
    "method=#{method_name}&nonce=#{Time.now.to_i}"
  end
end