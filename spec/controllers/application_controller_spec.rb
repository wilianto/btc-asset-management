require "rails_helper"

describe ApplicationController do
  describe "rescue_from ActionController::ParameterMissing" do
    controller do
      def index
        raise ActionController::ParameterMissing.new("key")
      end
    end

    it "respond with 400 when parameter missing" do
      get :index

      expect(response).to have_http_status :bad_request
    end
  end
end