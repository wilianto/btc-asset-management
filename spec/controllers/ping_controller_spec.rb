require 'rails_helper'

describe PingController do
  describe "GET /index" do
    before do
      allow(VipApi).to receive(:get_current_price).and_return({})
      allow(VipApi).to receive(:get_asset).and_return({})
    end

    it "responses with 200" do
      get :index

      expect(response).to have_http_status :ok
    end

    context "no change from old data" do
      before do
        allow(AssetCalculator).to receive(:is_change?).and_return false
      end

      it "doesnt sent notif to slack" do
        expect(SlackApi).not_to receive(:send_notif)
        get :index
      end
    end

    context "there are changes from old data" do
      before do
        allow(AssetCalculator).to receive(:is_change?).and_return true
        allow(AssetCalculator).to receive(:compare).and_return({idr: 0})
      end

      it "sent notif to slack" do
        expect(SlackApi).to receive(:send_notif).with("`#{{idr: 0}.to_json}`")
        get :index
      end
    end
  end
end
