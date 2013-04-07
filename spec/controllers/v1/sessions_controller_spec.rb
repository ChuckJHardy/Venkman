require 'spec_helper'

describe V1::SessionsController do
  describe "POST 'v1/sessions'" do
    let(:user) { FactoryGirl.create(:user) }
    let(:email) { user.email }
    let(:password) { 'password' }
    let(:attributes) {
      {
        email: email,
        password: password
      }
    }

    before do
      devise_mapping(:user)
      post :create, attributes
    end

    context 'user' do
      context 'failure' do
        let(:email) { 'test@example.com' }

        it { should respond_with(:unauthorized) }

        it 'returns expected user' do
          expect(response.body).to eq("{}")
        end
      end
    end

    context 'password' do
      context 'success' do
        it { should respond_with(:created) }

        it 'returns expected user' do
          Yajl::Parser.parse(response.body).tap do |json|
            expect(json).to have_key('user_id')
            expect(json).to have_key('authentication_token')
          end
        end
      end

      context 'failure' do
        let(:password) { '123' }

        it { should respond_with(:unauthorized) }

        it 'returns expected user' do
          expect(response.body).to eq("{}")
        end
      end
    end
  end

  describe "DELETE 'v1/sessions'" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      login_user(user)
      expect(controller.current_user).to eq(user)
      delete :destroy
    end

    it 'signs out user' do
      expect(controller.current_user).to be_nil
    end

    it 'returns no content' do
      expect(response.body).to eq(' ')
    end
  end
end
