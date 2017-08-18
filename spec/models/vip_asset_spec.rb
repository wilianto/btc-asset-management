require 'rails_helper'

describe VipAsset do
  it "has columns" do
    is_expected.to have_db_column :idr
    is_expected.to have_db_column :btc
    is_expected.to have_db_column :bch
    is_expected.to have_db_column :ltc
    is_expected.to have_db_column :doge
    is_expected.to have_db_column :xrp
    is_expected.to have_db_column :drk
    is_expected.to have_db_column :bts
    is_expected.to have_db_column :nxt
    is_expected.to have_db_column :str
    is_expected.to have_db_column :nem
    is_expected.to have_db_column :eth
    is_expected.to have_db_column :etc

    is_expected.to have_db_column :idr_hold
    is_expected.to have_db_column :btc_hold
    is_expected.to have_db_column :bch_hold
    is_expected.to have_db_column :ltc_hold
    is_expected.to have_db_column :doge_hold
    is_expected.to have_db_column :xrp_hold
    is_expected.to have_db_column :drk_hold
    is_expected.to have_db_column :bts_hold
    is_expected.to have_db_column :nxt_hold
    is_expected.to have_db_column :str_hold
    is_expected.to have_db_column :nem_hold
    is_expected.to have_db_column :eth_hold
    is_expected.to have_db_column :etc_hold

    is_expected.to have_db_column :price_btc_idr
    is_expected.to have_db_column :price_bch_idr
    is_expected.to have_db_column :price_ltc_btc
    is_expected.to have_db_column :price_doge_btc
    is_expected.to have_db_column :price_xrp_btc
    is_expected.to have_db_column :price_drk_btc
    is_expected.to have_db_column :price_bts_btc
    is_expected.to have_db_column :price_nxt_btc
    is_expected.to have_db_column :price_str_btc
    is_expected.to have_db_column :price_nem_btc
    is_expected.to have_db_column :price_eth_btc
    is_expected.to have_db_column :price_eth_idr
    is_expected.to have_db_column :price_etc_idr

    is_expected.to have_db_column :total_btc
    is_expected.to have_db_column :total_idr
  end

  context "before save callback" do
    it "set total_idr and total_btc" do
      asset = VipAsset.new idr: 10_000, idr_hold: 2_000,
                           btc: 0.001, btc_hold: 1.001,
                           bch: 0.001, bch_hold: 1.500,
                           eth: 0.15, eth_hold: 0.1,
                           etc: 0.16, etc_hold: 0.2,
                           price_btc_idr: 9_000, price_bch_idr: 8_000, 
                           price_eth_btc: 14_000_000, price_etc_idr: 5_000
      asset.save!

      total_btc = (
                    BigDecimal.new("0.001") + BigDecimal.new("1.001") + 
                    ((BigDecimal.new("0.15") + BigDecimal.new("0.1")) * BigDecimal.new("14000000") / BigDecimal.new("100000000")) + 
                    ((BigDecimal.new("10000") + BigDecimal.new("2000")) / BigDecimal.new("9000"))
                  )
      total_bch = BigDecimal.new("0.001") + BigDecimal.new("1.500")
      total_etc = BigDecimal.new("0.16") + BigDecimal.new("0.2")
      total_idr = total_btc * BigDecimal.new("9_000") + total_bch * BigDecimal.new("8000") + total_etc * BigDecimal.new("5000")
      expect(asset.total_btc).to eq total_btc.round(5)
      expect(asset.total_idr).to eq total_idr.round(5)
    end

    context "no exchange price rate" do
      it "saves successfully" do
        asset = create :vip_asset, idr: 1000, btc: 5

        expect(asset.total_btc).to eq BigDecimal.new("5").round(5)
        expect(asset.total_idr).to eq BigDecimal.new("1000").round(5)
      end
    end
  end

  context "after initialize callback" do
    it "set total_idr and total_btc" do
      asset = VipAsset.new idr: 10_000, idr_hold: 2_000,
                           btc: 0.001, btc_hold: 1.001,
                           eth: 0.15, eth_hold: 0.1,
                           price_btc_idr: 9_000, price_eth_btc: 14_000_000

      total_btc = (
                    BigDecimal.new("0.001") + BigDecimal.new("1.001") + 
                    ((BigDecimal.new("0.15") + BigDecimal.new("0.1")) * BigDecimal.new("14000000") / BigDecimal.new("100000000")) + 
                    ((BigDecimal.new("10000") + BigDecimal.new("2000")) / BigDecimal.new("9000"))
                  )
      total_idr = total_btc * BigDecimal.new("9_000")
      expect(asset.total_btc).to eq total_btc.round(5)
      expect(asset.total_idr).to eq total_idr.round(5)
    end
  end

  describe "#percentage" do
    context "idr" do
      it "returns percentage of the asset" do
        asset = create :vip_asset, idr: 1_000, idr_hold: 2_000, btc: 1, price_btc_idr: 10_000
        percentage_idr = (1_000 + 2_000) / (13_000.0) * 100
        expect(asset.percentage "idr").to eq percentage_idr.round(2)
      end

      it "returns zero instead of nil" do
        asset = create :vip_asset
        expect(asset.percentage "idr").to eq 0.0
      end
    end

    context "btc" do
      it "returns percentage of the asset" do
        asset = create :vip_asset, idr: 1_000, idr_hold: 2_000, btc: 1, btc_hold: 0.5, price_btc_idr: 10_000
        percentage_btc = (1.5 * 10_000) / 18_000.0 * 100
        expect(asset.percentage "btc").to eq percentage_btc.round(2)
      end
    end

    context "bch" do
      it "returns percentage of the asset" do
        asset = create :vip_asset, idr: 1_000, idr_hold: 2_000, bch: 1, bch_hold: 0.5, price_bch_idr: 10_000
        percentage_bch = (1.5 * 10_000) / 18_000.0 * 100
        expect(asset.percentage "bch").to eq percentage_bch.round(2)
      end
    end

    context "etc" do
      it "returns percentage of the asset" do
        asset = create :vip_asset, idr: 1_000, idr_hold: 2_000, etc: 1, etc_hold: 0.5, price_etc_idr: 10_000
        percentage_etc = (1.5 * 10_000) / 18_000.0 * 100
        expect(asset.percentage "etc").to eq percentage_etc.round(2)
      end
    end

    context "other currency" do
      it "returns percentage of the asset" do
        asset = create :vip_asset, eth: 0.5, eth_hold: 1, price_eth_btc: 10_000_000, btc: 1, price_btc_idr: 10_000
        percentage_eth = (1.5 * 10_000_000 * 10_000) / 11_500 * 100 / 100_000_000
        expect(asset.percentage "eth").to eq percentage_eth.round(2)
      end
    end
  end

  describe "#count_idr_eth_btc_idr" do
    it "calculate trade for idr->eth->btc->idr" do
      asset = create :vip_asset, idr: 10_000, idr_hold: 5_000,
                    price_eth_idr: 4_000, price_eth_btc: 70_000_000, price_btc_idr: 5_000
      total = 15_000 / 4_000.0 * (70_000_000 / 100_000_000.0) * 5_000
      margin = total - 15_000
      expect(asset.count_idr_eth_btc_idr).to eq margin.round(2)
    end
  end

  describe "#count_idr_btc_eth_idr" do
    it "calculate trade for idr->btc->eth->idr" do
      asset = create :vip_asset, idr: 10_000, idr_hold: 5_000,
                    price_eth_idr: 4_000, price_eth_btc: 70_000_000, price_btc_idr: 5_000
      total = 15_000 / 5_000.0 / (70_000_000 / 100_000_000.0) * 4_000
      margin = total - 15_000
      expect(asset.count_idr_btc_eth_idr).to eq margin.round(2)
    end
  end
end
