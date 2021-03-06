class V1::BaseController < ApplicationController
  before_filter :authenticate_user!

  def current_user
    V1::UserDecorator.decorate(super) unless super.nil?
  end
end
