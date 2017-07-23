require "spec_helper"

describe "pages/preview.jbuilder" do
  let(:vip_asset) { build :vip_asset }
  let(:json) { JSON.parse rendered }

  it "has attributes" do
    assign :vip_asset, vip_asset

    render

    expect(json["balance"]["idr"]).to be_present
    expect(json["balance"]["btc"]).to be_present
    expect(json["balance"]["ltc"]).to be_present
    expect(json["balance"]["doge"]).to be_present
    expect(json["balance"]["xrp"]).to be_present
    expect(json["balance"]["drk"]).to be_present
    expect(json["balance"]["bts"]).to be_present
    expect(json["balance"]["nxt"]).to be_present
    expect(json["balance"]["str"]).to be_present
    expect(json["balance"]["nem"]).to be_present
    expect(json["balance"]["eth"]).to be_present

    expect(json["balance_hold"]["idr"]).to be_present
    expect(json["balance_hold"]["btc"]).to be_present
    expect(json["balance_hold"]["ltc"]).to be_present
    expect(json["balance_hold"]["doge"]).to be_present
    expect(json["balance_hold"]["xrp"]).to be_present
    expect(json["balance_hold"]["drk"]).to be_present
    expect(json["balance_hold"]["bts"]).to be_present
    expect(json["balance_hold"]["nxt"]).to be_present
    expect(json["balance_hold"]["str"]).to be_present
    expect(json["balance_hold"]["nem"]).to be_present
    expect(json["balance_hold"]["eth"]).to be_present

    expect(json["percentage"]["idr"]).to be_present
    expect(json["percentage"]["btc"]).to be_present
    expect(json["percentage"]["ltc"]).to be_present
    expect(json["percentage"]["doge"]).to be_present
    expect(json["percentage"]["xrp"]).to be_present
    expect(json["percentage"]["drk"]).to be_present
    expect(json["percentage"]["bts"]).to be_present
    expect(json["percentage"]["nxt"]).to be_present
    expect(json["percentage"]["str"]).to be_present
    expect(json["percentage"]["nem"]).to be_present
    expect(json["percentage"]["eth"]).to be_present

    expect(json["total_idr"]).to be_present
    expect(json["total_btc"]).to be_present
  end
end