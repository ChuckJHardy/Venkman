require 'spec_helper_lite'

require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'rspec/fire'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
  config.filter_run :focus => true
  config.color_enabled = true
  config.run_all_when_everything_filtered = true
  config.infer_base_class_for_anonymous_controllers = true

  config.include RSpec::Fire
  config.include Devise::TestHelpers, :type => :controller
  config.include ControllerMacros, :type => :controller

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end

RspecApiDocumentation.configure do |config|
  config.docs_dir = Rails.root.join("public", "docs")
  config.url_prefix = "/docs"
end

RSpec::Fire.configure do |config|
  config.verify_constant_names = true
end
