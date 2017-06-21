require 'rails_helper'

describe PingController do
  describe "GET /index" do
    before do
      allow(VipApi).to receive(:get_current_price).and_return({})
      allow(VipApi).to receive(:get_asset).and_return({})
    end

    it "responses with 200" do
      vip_asset = attributes_for :vip_asset
      get :index

      expect(response).to have_http_status :ok
    end
  end
end
