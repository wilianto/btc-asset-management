require "spec_helper"

describe "Page routing" do
  it { expect(get "/preview").to route_to controller: "pages", action: "preview" }
end