require "rails_helper"

describe "Ping" do
  before do
    allow(VipApi).to receive(:get_current_price).and_return({})
    allow(VipApi).to receive(:get_asset).and_return({})
  end

  it "saves data to DB" do
    vip_asset = attributes_for(:vip_asset)

    expect {
      get "/ping", params: { vip_asset: vip_asset }
    }.to change { VipAsset.count }.by(1)

    expect(response).to have_http_status :ok
  end
end