# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vip_asset do
    idr { 0 }
    btc { 0 }
    ltc { 0 }
    doge { 0 }
    xrp { 0 }
    drk { 0 }
    bts { 0 }
    nxt { 0 }
    str { 0 }
    nem { 0 }
    eth { 0 }

    idr_hold { 0 }
    btc_hold { 0 }
    ltc_hold { 0 }
    doge_hold { 0 }
    xrp_hold { 0 }
    drk_hold { 0 }
    bts_hold { 0 }
    nxt_hold { 0 }
    str_hold { 0 }
    nem_hold { 0 }
    eth_hold { 0 }

    price_btc_idr { 0 }
    price_ltc_btc { 0 }
    price_doge_btc { 0 }
    price_xrp_btc { 0 }
    price_drk_btc { 0 }
    price_bts_btc { 0 }
    price_nxt_btc { 0 }
    price_str_btc { 0 }
    price_nem_btc { 0 }
    price_eth_btc { 0 }

    total_btc { 0 }
    total_idr { 0 }
  end
end
