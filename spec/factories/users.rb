require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email 'example@venkman-app.com'
    password 'password'
    password_confirmation 'password'
  end
end
