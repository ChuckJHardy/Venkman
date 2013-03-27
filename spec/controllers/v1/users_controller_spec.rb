require 'spec_helper'

describe V1::UsersController do
  describe "GET '/user/1'" do
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

  describe "POST '/users'" do
    let(:attributes) { FactoryGirl.attributes_for(:user) }

    context 'success' do
      before { post :create, user: attributes }

      it { should respond_with(:created) }

      it 'signs in new user' do
        expect(controller.current_user).to_not be_nil
      end

      it 'returns expected user' do
        Yajl::Parser.parse(response.body)['user'].tap do |json|
          expect(json).to have_key('id')
          expect(json).to have_key('email')
          expect(json).to have_key('authentication_token')
        end
      end
    end

    context 'failed' do
      before { post :create, user: {} }

      let(:errors) {
        {
          "email" => [
            "can't be blank"
          ],
          "password" => [
            "can't be blank"
          ]
        }
      }

      it { should respond_with(:unprocessable_entity) }

      it 'returns errors' do
        Yajl::Parser.parse(response.body).tap do |record|
          expect(record).to eq(errors)
        end
      end
    end
  end

  describe "PATCH/PUT '/user/1'" do
    let(:user) { FactoryGirl.create(:user) }
    let(:token) { user.authentication_token }

    context 'success' do
      let(:updates) {
        {
          email: 'example2@venkman-app.com'
        }
      }

      before { put :update, id: user.id, user: updates, auth_token: token }

      it { should respond_with(204) }
    end

    context 'failed' do
      let(:updates) {
        {
          email: ''
        }
      }

      let(:errors) {
        {
          "email" => [
            "can't be blank"
          ]
        }
      }

      before { put :update, id: user.id, user: updates, auth_token: token }

      it { should respond_with(:unprocessable_entity) }

      it 'returns errors' do
        Yajl::Parser.parse(response.body).tap do |record|
          expect(record).to eq(errors)
        end
      end
    end
  end

  describe "DETETE '/user/1'" do
    let(:user) { FactoryGirl.create(:user) }
    let(:token) { user.authentication_token }

    before { delete :destroy, id: user.id, auth_token: token }

    it { should respond_with(204) }

    it 'returns expected user' do
      expect { User.find user.id }.to raise_error
    end
  end
end
