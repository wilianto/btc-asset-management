require 'rails_helper'

describe VipAsset do
  it "has columns" do
    is_expected.to have_db_column :idr
    is_expected.to have_db_column :btc
    is_expected.to have_db_column :ltc
    is_expected.to have_db_column :doge
    is_expected.to have_db_column :xrp
    is_expected.to have_db_column :drk
    is_expected.to have_db_column :bts
    is_expected.to have_db_column :nxt
    is_expected.to have_db_column :str
    is_expected.to have_db_column :nem
    is_expected.to have_db_column :eth

    is_expected.to have_db_column :idr_hold
    is_expected.to have_db_column :btc_hold
    is_expected.to have_db_column :ltc_hold
    is_expected.to have_db_column :doge_hold
    is_expected.to have_db_column :xrp_hold
    is_expected.to have_db_column :drk_hold
    is_expected.to have_db_column :bts_hold
    is_expected.to have_db_column :nxt_hold
    is_expected.to have_db_column :str_hold
    is_expected.to have_db_column :nem_hold
    is_expected.to have_db_column :eth_hold

    is_expected.to have_db_column :price_btc_idr
    is_expected.to have_db_column :price_ltc_btc
    is_expected.to have_db_column :price_doge_btc
    is_expected.to have_db_column :price_xrp_btc
    is_expected.to have_db_column :price_drk_btc
    is_expected.to have_db_column :price_bts_btc
    is_expected.to have_db_column :price_nxt_btc
    is_expected.to have_db_column :price_str_btc
    is_expected.to have_db_column :price_nem_btc
    is_expected.to have_db_column :price_eth_btc

    is_expected.to have_db_column :total_btc
    is_expected.to have_db_column :total_idr
  end

  context "before save callback" do
    it "set total_idr and total_btc" do
      asset = VipAsset.new idr: 10_000, idr_hold: 2_000, btc: 0.001, btc_hold: 1.001, eth: 0.15, eth_hold: 0.1, price_btc_idr: 9_000, price_eth_btc: 14_000_000
      asset.save!

      total_btc = ((0.001 + 1.001) + ((0.15 + 0.1) * 14_000_000 / 100_000_000) + ((10_000 + 2_000) / 9_000.0)).round(5)
      total_idr = total_btc * 9_000
      expect(asset.total_btc).to eq total_btc.round(5)
      expect(asset.total_idr).to eq total_idr.round(5)
    end
  end
end
