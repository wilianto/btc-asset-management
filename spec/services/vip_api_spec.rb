require "rails_helper"

describe VipApi do
  before do
    stub_const("ENV", ENV.to_hash.merge!({
      "CURRENT_PRICE_URL" => "https://vip.bitcoin.co.id/api/eth_btc/webdata",
      "BASE_API_URL" => "https://vip.bitcoin.co.id/tapi",
      "VIP_KEY" => "MY_VIP_KEY",
      "VIP_SECRET" => "MY_VIP_SECRET"
    }))
  end

  describe "#get_current_price" do
    before do
      stub_request(:get, "https://vip.bitcoin.co.id/api/eth_btc/webdata")
        .to_return(
          status: status,
          headers: { 'Content-Type': 'application/json' },
          body: body.to_json
        )
    end

    context "when success" do
      let(:status) { :ok }
      let(:body) { JSON.parse file_fixture("current_price_success_response.json").read }

      it "returns hash" do
        prices = VipApi.get_current_price
        expect(prices[:price_btc_idr]).to eq 36_000_000
        expect(prices[:price_bch_idr]).to eq 3_000_000
        expect(prices[:price_eth_idr]).to eq 300_000
        expect(prices[:price_etc_idr]).to eq 30_000
        expect(prices[:price_xzc_idr]).to eq 3_000
        expect(prices[:price_btg_idr]).to eq 4_000
        expect(prices[:price_ltc_btc]).to eq 1600
        expect(prices[:price_doge_btc]).to eq 120
        expect(prices[:price_xrp_btc]).to eq 9000
        expect(prices[:price_drk_btc]).to eq 6800
        expect(prices[:price_bts_btc]).to eq 12000
        expect(prices[:price_nxt_btc]).to eq 6400
        expect(prices[:price_str_btc]).to eq 1500
        expect(prices[:price_nem_btc]).to eq 7700
        expect(prices[:price_eth_btc]).to eq 1400
      end
    end
  end

  describe "#get_asset" do
    before do
      Timecop.freeze 2017, 1, 1 #timestamp 1483228800
      allow(VipApi).to receive(:get_sign).with("MY_VIP_SECRET", "method=getInfo&nonce=1483228800").and_return "SIGNED_KEY"

      stub_request(:post, "https://vip.bitcoin.co.id/tapi")
        .with(
          headers: {
            "Sign" => "SIGNED_KEY",
            "Key" => "MY_VIP_KEY",
            "Content-Type" => "application/x-www-form-urlencoded"
          },
          body: "method=getInfo&nonce=1483228800"
        )
        .to_return(
          status: status,
          headers: { 'Content-Type': 'application/json' },
          body: body.to_json
        )
    end

    context "when success" do
      let(:status) { :ok }
      let(:body) { JSON.parse file_fixture("get_asset_success_response.json").read }

      it "returns hash" do
        assets = VipApi.get_asset

        expect(assets[:idr]).to eq 1000
        expect(assets[:btc]).to eq 0.56789
        expect(assets[:bch]).to eq 0.50000
        expect(assets[:xzc]).to eq 0.40000
        expect(assets[:etc]).to eq 0.30000
        expect(assets[:ltc]).to eq 3000
        expect(assets[:doge]).to eq 4000
        expect(assets[:xrp]).to eq 5000
        expect(assets[:drk]).to eq 6000
        expect(assets[:bts]).to eq 7000
        expect(assets[:nxt]).to eq 8000
        expect(assets[:str]).to eq 9000
        expect(assets[:nem]).to eq 10000
        expect(assets[:eth]).to eq 11000
        expect(assets[:btg]).to eq 12000

        expect(assets[:idr_hold]).to eq 10000
        expect(assets[:btc_hold]).to eq 0.245
        expect(assets[:bch_hold]).to eq 0.200
        expect(assets[:xzc_hold]).to eq 0.300
        expect(assets[:etc_hold]).to eq 0.400
        expect(assets[:ltc_hold]).to eq 30000
        expect(assets[:doge_hold]).to eq 40000
        expect(assets[:xrp_hold]).to eq 50000
        expect(assets[:drk_hold]).to eq 60000
        expect(assets[:bts_hold]).to eq 70000
        expect(assets[:nxt_hold]).to eq 80000
        expect(assets[:str_hold]).to eq 90000
        expect(assets[:nem_hold]).to eq 100000
        expect(assets[:eth_hold]).to eq 110000
        expect(assets[:btg_hold]).to eq 120000
      end
    end

    context "when error" do
      let(:status) { :ok }
      let(:body) do
        {
          "success" => 0,
          "error" => "There is a trouble dude!"
        }
      end

      it "returns nil and writes log" do
        expect(Rails.logger).to receive(:error).with("[VIP_ERROR_GETINFO] There is a trouble dude!")
        expect(VipApi.get_asset).to eq nil
      end
    end
  end

  describe "#get_sign" do
    it "returns base64 hmac hash" do
      hash = VipApi.get_sign "key", "data"
      expect(hash).to eq "3c5953a18f7303ec653ba170ae334fafa08e3846f2efe317b87efce82376253cb52a8c31ddcde5a3a2eee183c2b34cb91f85e64ddbc325f7692b199473579c58"
    end
  end
end