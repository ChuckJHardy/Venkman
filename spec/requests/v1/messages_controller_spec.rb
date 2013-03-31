require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource "Message" do
  get "v1/users/:user_id/messages" do
    let(:message) { FactoryGirl.create(:message) }
    let(:id) { message.id }
    let(:user_id) { message.user.id }
    let(:auth_token) { message.user.authentication_token }

    before { message }

    parameter :auth_token, "User authentication token"
    required_parameters :auth_token

    example_request "Getting messages" do
      status.should == 200

      Yajl::Parser.parse(response_body).first['message'].tap do |json|
        json['id'].should eq(id)
        json['user_id'].should eq(user_id)
        json['subject'].should eq(message.subject)
        json['body'].should eq(message.body)
      end
    end
  end

  get "v1/users/:user_id/messages/:id" do
    let(:message) { FactoryGirl.create(:message) }
    let(:user_id) { message.user.id }
    let(:id) { message.id }
    let(:auth_token) { message.user.authentication_token }

    before { message }

    parameter :auth_token, "User authentication token"
    required_parameters :auth_token

    example_request "Getting message details" do
      status.should == 200

      Yajl::Parser.parse(response_body)['message'].tap do |json|
        json['id'].should eq(id)
        json['user_id'].should eq(user_id)
        json['subject'].should eq(message.subject)
        json['body'].should eq(message.body)
      end
    end
  end

  delete "v1/users/:user_id/messages/:id" do
    let(:message) { FactoryGirl.create(:message) }
    let(:user_id) { message.user.id }
    let(:id) { message.id }
    let(:auth_token) { message.user.authentication_token }

    before { message }

    parameter :auth_token, "User authentication token"

    required_parameters :auth_token

    example_request "Delete a Message" do
      status.should == 204
    end
  end
end
