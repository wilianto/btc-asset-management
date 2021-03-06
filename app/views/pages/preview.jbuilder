json.balance do
  json.idr @vip_asset.idr.to_f
  json.btc @vip_asset.btc.to_f
  json.etc @vip_asset.etc.to_f
  json.bch @vip_asset.bch.to_f
  json.xzc @vip_asset.xzc.to_f
  json.ltc @vip_asset.ltc.to_f
  json.doge @vip_asset.doge.to_f
  json.xrp @vip_asset.xrp.to_f
  json.drk @vip_asset.drk.to_f
  json.bts @vip_asset.bts.to_f
  json.nxt @vip_asset.nxt.to_f
  json.str @vip_asset.str.to_f
  json.nem @vip_asset.nem.to_f
  json.eth @vip_asset.eth.to_f
  json.btg @vip_asset.btg.to_f
end

json.balance_hold do
  json.idr @vip_asset.idr_hold.to_f
  json.btc @vip_asset.btc_hold.to_f
  json.etc @vip_asset.etc_hold.to_f
  json.bch @vip_asset.bch_hold.to_f
  json.xzc @vip_asset.xzc_hold.to_f
  json.ltc @vip_asset.ltc_hold.to_f
  json.doge @vip_asset.doge_hold.to_f
  json.xrp @vip_asset.xrp_hold.to_f
  json.drk @vip_asset.drk_hold.to_f
  json.bts @vip_asset.bts_hold.to_f
  json.nxt @vip_asset.nxt_hold.to_f
  json.str @vip_asset.str_hold.to_f
  json.nem @vip_asset.nem_hold.to_f
  json.eth @vip_asset.eth_hold.to_f
  json.btg @vip_asset.btg_hold.to_f
end

json.percentage do
  json.idr @vip_asset.percentage("idr").to_f
  json.btc @vip_asset.percentage("btc").to_f
  json.etc @vip_asset.percentage("etc").to_f
  json.bch @vip_asset.percentage("bch").to_f
  json.xzc @vip_asset.percentage("xzc").to_f
  json.ltc @vip_asset.percentage("ltc").to_f
  json.doge @vip_asset.percentage("doge").to_f
  json.xrp @vip_asset.percentage("xrp").to_f
  json.drk @vip_asset.percentage("drk").to_f
  json.bts @vip_asset.percentage("bts").to_f
  json.nxt @vip_asset.percentage("nxt").to_f
  json.str @vip_asset.percentage("str").to_f
  json.nem @vip_asset.percentage("nem").to_f
  json.eth @vip_asset.percentage("eth").to_f
  json.btg @vip_asset.percentage("btg").to_f
end

json.simulations do
  json.idr_eth_btc_idr @vip_asset.count_idr_eth_btc_idr.to_f
  json.idr_btc_eth_idr @vip_asset.count_idr_btc_eth_idr.to_f
end

json.total_idr @vip_asset.total_idr.to_f
json.total_btc @vip_asset.total_btc.to_f