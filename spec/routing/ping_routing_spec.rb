require "rails_helper"

describe "routes to ping" do
  it "has routes" do
    expect(get "/ping").to route_to controller: "ping", action: "index"
  end
end