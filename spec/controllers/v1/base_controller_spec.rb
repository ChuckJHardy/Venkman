require 'spec_helper'

describe V1::BaseController do
  controller do
    def index
      render json: current_user
    end
  end

  describe "GET 'index'" do
    let(:user) { FactoryGirl.create(:user) }
    let(:auth_token) { user.authentication_token }

    before { get :index, auth_token: auth_token }

    it 'returns decoratred user' do
      Yajl::Parser.parse(response.body).tap do |json|
        json['user']['id'].should eq(user.id)
        json['user']['email'].should eq(user.email)
        json['user']['authentication_token'].should eq(auth_token)
      end
    end
  end
end
