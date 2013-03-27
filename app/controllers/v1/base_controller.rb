class V1::BaseController < ApplicationController
  def current_user
    V1::UserDecorator.decorate(super) unless super.nil?
  end
end
