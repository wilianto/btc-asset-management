require "spec_helper"

describe AssetCalculator do
  describe ".is_change?" do
    context "when not change" do
      it "returns false" do
        old_vip_asset = build :vip_asset, idr: 1_000, idr_hold: 1_500, btc: 0.2, btc_hold: 0.3
        new_vip_asset = build :vip_asset, idr: 1_000, idr_hold: 1_500, btc: 0.2, btc_hold: 0.3

        is_change = AssetCalculator.is_change? old_vip_asset, new_vip_asset
        expect(is_change).to eq false
      end
    end

    context "when change" do
      it "returns true" do
        old_vip_asset = build :vip_asset, idr: 1_000, idr_hold: 1_500, btc: 0.2, btc_hold: 0.3
        new_vip_asset = build :vip_asset, idr: 1_000, idr_hold: 0, btc: 0.2, btc_hold: 0.3

        is_change = AssetCalculator.is_change? old_vip_asset, new_vip_asset
        expect(is_change).to eq true
      end
    end

    context "when nil" do
      it "returns false" do
        is_change = AssetCalculator.is_change? nil, nil
        expect(is_change).to eq false
      end
    end
  end

  describe ".compare" do
    it "returns changed total currency" do
      old_vip_asset = build :vip_asset, idr: 1_000, idr_hold: 1_500, btc: 0.2, btc_hold: 0.3
      new_vip_asset = build :vip_asset, idr: 1_000, idr_hold: 0, btc: 0.5, btc_hold: 0.3

      compare = AssetCalculator.compare old_vip_asset, new_vip_asset
      expect(compare).to eq({
        idr: -1_500.0,
        btc: 0.3
      })
    end
  end
end