class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  before_filter :authenticate_user!
end
