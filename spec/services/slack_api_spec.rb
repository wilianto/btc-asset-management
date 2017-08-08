require "rails_helper"

describe SlackApi do
  before do
    stub_const("ENV", ENV.to_hash.merge!({
      "SLACK_WEBHOOK_URL" => "https://hooks.slack.com/services/hash"
    }))
  end

  describe ".send_notif" do
    before do
      stub_request(:post, "https://hooks.slack.com/services/hash")
        .with(
          headers: {
            "Content-Type" => "application/json"
          },
          body: {
            text: "your text here"
          }.to_json
        )
        .to_return(
          status: :ok,
          body: "ok"
        )
    end

    it "response with ok body" do
      response = SlackApi.send_notif "your text here"
      expect(response).to eq "ok"
    end
  end
end