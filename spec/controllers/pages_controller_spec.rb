require "rails_helper"

describe PagesController do
  describe "GET /preview" do
    before do
      allow(VipApi).to receive(:get_current_price).and_return({no_registered_currency: 0})
      allow(VipApi).to receive(:get_asset).and_return({})
    end

    it "responses ok" do
      get :preview

      expect(response).to have_http_status :ok
    end
  end
end