require 'spec_helper'

describe V1::UsersController do
  describe "GET 'v1/user/1'" do
    let(:user) { FactoryGirl.create(:user) }
    let(:token) { user.authentication_token }

    before { get :show, id: user.id, auth_token: token }

    it { should respond_with(:success) }

    it 'returns expected user' do
      Yajl::Parser.parse(response.body)['user'].tap do |json|
        expect(json).to have_key('id')
        expect(json).to have_key('email')
        expect(json).to have_key('authentication_token')
      end
    end
  end

  describe "DETETE 'v1/user/1'" do
    let(:user) { FactoryGirl.create(:user) }
    let(:token) { user.authentication_token }

    before { delete :destroy, id: user.id, auth_token: token }

    it { should respond_with(204) }

    it 'returns expected user' do
      expect { User.find user.id }.to raise_error
    end
  end
end
