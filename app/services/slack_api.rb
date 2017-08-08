class SlackApi
  include HTTParty

  def self.send_notif message
    response_obj = self.send_request message
    return response_obj.body
  end

  private
  def self.send_request message
    post ENV["SLACK_WEBHOOK_URL"], {
      headers: {
        "Content-Type" => "application/json"
      },
      body: {
        text: message
      }.to_json
    }
  end
end