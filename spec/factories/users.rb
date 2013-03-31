require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|number| "example#{number}@venkman-app.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :message do
    subject "Through the Looking Glass"
    body "Lorem Ipsum is simply dummy text of the printing and typesetting."

    user
  end
end
