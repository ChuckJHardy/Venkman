source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '~> 3.2.18'
gem 'rails-api', "~> 0.0.3"
gem 'pg', "~> 0.15.0"
gem 'thin', "~> 1.5.1"
gem "devise", "~> 2.2.3"
gem "dalli", "~> 2.6.2"
gem "yajl-ruby", "~> 1.1.0", require: 'yajl'
gem "draper", "~> 1.2.1"
gem "gmailish", "~> 0.0.1"
gem "clockwork", "~> 0.5.0"
gem "sidekiq", "~> 2.11.2"
gem "coveralls", "~> 0.6.3", require: false

group :development do
  gem 'foreman', "~> 0.62.0"
  gem "annotate", "~> 2.5.0"
  gem "rails_best_practices", "~> 1.13.5"
end

group :test do
  gem "rspec-fire", "~> 1.1.3"
  gem "factory_girl_rails", "~> 4.2.1"
  gem "database_cleaner", "~> 0.9.1"
  gem "shoulda-matchers", "~> 2.1.0"
  gem "rspec_api_documentation", "~> 0.8.0"
  gem "simplecov", "~> 0.7.1", require: false
end

group :test, :development do
  gem "rspec-rails", "~> 2.0"
end
