require 'clockwork'
require_relative "config/boot"
require_relative "config/environment"

module Clockwork
  every 1.minute, 'postman.pickup' do
    PostmanPickup.perform_async
  end
end
