require 'spec_helper'

describe V1::MessagesController do
  describe "GET 'v1/user/1/messages'" do
    let(:message) { FactoryGirl.create(:message) }
    let(:token) { message.user.authentication_token }

    before do
      get :index, user_id: message.user.id, auth_token: token
    end

    it { should respond_with(:success) }

    it 'returns an array' do
      Yajl::Parser.parse(response.body).tap do |json|
        expect(json).to be_an_instance_of(Array)
      end
    end

    it 'returns expected user' do
      Yajl::Parser.parse(response.body).first['message'].tap do |json|
        expect(json).to have_key('id')
        expect(json).to have_key('user_id')
        expect(json).to have_key('subject')
        expect(json).to have_key('body')
        expect(json).to have_key('created_at')
        expect(json).to have_key('updated_at')
      end
    end
  end

  describe "GET 'v1/user/1/messages/1'" do
    let(:message) { FactoryGirl.create(:message) }
    let(:token) { message.user.authentication_token }

    before do
      get :show, id: message.id,
                 user_id: message.user.id,
                 auth_token: token
    end

    it { should respond_with(:success) }

    it 'returns expected user' do
      Yajl::Parser.parse(response.body)['message'].tap do |json|
        expect(json).to have_key('id')
        expect(json).to have_key('user_id')
        expect(json).to have_key('subject')
        expect(json).to have_key('body')
        expect(json).to have_key('created_at')
        expect(json).to have_key('updated_at')
      end
    end
  end

  describe "DETETE 'v1/users/1/messages/1'" do
    let(:message) { FactoryGirl.create(:message) }
    let(:token) { message.user.authentication_token }

    before do
      delete :destroy, id: message.id,
                       user_id: message.user.id,
                       auth_token: token
    end

    it { should respond_with(204) }

    it 'returns expected user' do
      expect { Message.find message.id }.to raise_error
    end
  end
end
