class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing do
    render body: nil, status: :bad_request
  end
end
