require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|number| "example#{number}@venkman-app.com" }
    password 'password'
    password_confirmation 'password'
  end
end
