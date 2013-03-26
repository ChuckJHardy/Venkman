require 'spec_helper'

describe User do
  let(:instance) { User.new(attributes) }
  let(:attributes) { FactoryGirl.attributes_for(:user) }

  describe 'Devise Modules' do
    let(:expected_modules) {
      [
        :database_authenticatable,
        :token_authenticatable,
        :rememberable,
        :recoverable,
        :registerable,
        :validatable,
        :lockable,
        :trackable
      ]
    }

    it 'receives devise with give arguments' do
      expect(described_class.devise_modules).to eq(expected_modules)
    end
  end

  describe 'Before Filters' do
    describe '.ensure_authentication_token' do
      it 'gets called' do
        instance.should_receive(:ensure_authentication_token)

        instance.save!
      end
    end
  end

  describe 'Mass Assignment' do
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
    it { should allow_mass_assignment_of(:remember_me) }
  end
end
