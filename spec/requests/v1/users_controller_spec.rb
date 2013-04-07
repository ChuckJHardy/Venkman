require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "User" do
  get "v1/users/:id" do
    let(:user) { FactoryGirl.create(:user) }
    let(:id) { user.id }
    let(:auth_token) { user.authentication_token }

    before { user }

    parameter :auth_token, "User authentication token"
    required_parameters :auth_token

    example_request "Getting user details" do
      status.should == 200

      Yajl::Parser.parse(response_body).tap do |json|
        json['user']['id'].should eq(1)
        json['user']['email'].should eq(user.email)
        json['user']['authentication_token'].should eq(auth_token)
      end
    end
  end

  post "v1/registrations" do
    let(:email) { "chuckjhardy@venkman-app.com" }
    let(:password) { "ABC123789" }
    let(:password_confirmation) { "ABC123789" }

    parameter :email, "Email for this account"
    parameter :password, "Chosen password"
    parameter :password_confirmation, "Confirm chosen password"

    # scope_parameters :user, [ :email, :password, :password_confirmation ]

    required_parameters :email, :password, :password_confirmation

    example_request "Create a new User" do
      status.should == 201

      Yajl::Parser.parse(response_body).tap do |json|
        json['user_id'].should eq(1)
        json['authentication_token'].should eq(User.first.authentication_token)
      end
    end
  end

  delete "v1/users/:id" do
    let(:user) { FactoryGirl.create(:user) }
    let(:id) { user.id }
    let(:auth_token) { user.authentication_token }

    before { user }

    parameter :auth_token, "User authentication token"

    required_parameters :auth_token

    example_request "Delete a User" do
      status.should == 204
    end
  end
end
