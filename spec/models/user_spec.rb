# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  authentication_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'spec_helper'

describe User do
  let(:instance) { User.new(attributes) }
  let(:attributes) { FactoryGirl.attributes_for(:user) }

  describe 'Devise Modules' do
    let(:expected_modules) {
      [
        :database_authenticatable,
        :token_authenticatable,
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

  describe 'Relationships' do
    it { should have_many(:messages).dependent(:destroy) }
  end

  describe 'Before Filters' do
    describe '.ensure_authentication_token' do
      it 'gets called' do
        instance.should_receive(:ensure_authentication_token)

        instance.save!
      end
    end

    describe '.uid' do
      let(:hex) { "696768d1b9e0291ee37a2ef4ce8253e4" }

      it 'gets called' do
        UniqueIdentifier.should_receive(:for).
          exactly(3).times.
          with(instance.email).
          and_return(hex)

        instance.save!

        expect(instance.uid).to eq(hex)
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
