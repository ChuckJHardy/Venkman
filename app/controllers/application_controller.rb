class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def server_status
    head :ok
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Content-Type'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    render text: '', content_type: 'text/plain' if request.method == :options
  end
end
