require 'spec_helper'

describe V1::RegistrationsController do
  describe "POST 'v1/registrations'" do
    let(:email) { 'chuckjhardy@venkmapapp.com' }
    let(:password) { 'ABC123987' }

    before do
      devise_mapping(:user)
      post :create, attributes
    end

    context 'success' do
      let(:attributes) {
        {
          email: email,
          password: password,
          password_confirmation: password
        }
      }

      it { should respond_with(:created) }

      it 'returns expected user' do
        Yajl::Parser.parse(response.body).tap do |json|
          expect(json).to have_key('user_id')
          expect(json).to have_key('authentication_token')
        end
      end
    end

    context 'failure' do
      let(:attributes) {}

      let(:errors) {
        {
          "message" => {
            "email" => ["can't be blank"],
            "password" => ["can't be blank"]
          }
        }
      }

      it { should respond_with(:unprocessable_entity) }

      it 'returns expected user' do
        Yajl::Parser.parse(response.body).tap do |json|
          expect(json).to eq(errors)
        end
      end
    end
  end
end
