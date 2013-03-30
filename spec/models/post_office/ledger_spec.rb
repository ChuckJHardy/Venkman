require 'spec_helper'

describe PostOffice::Ledger do
  let(:instance) { described_class.new(user, arguments) }
  let(:arguments) { { subject: 'Test Subject' } }
  let(:user) { FactoryGirl.create(:user) }

  describe '#initialize' do
    it 'takes arguments' do
      instance
    end
  end

  describe '.initial' do
    subject { described_class.initial(user, arguments) }

    it 'calls of to initial' do
      described_class.any_instance.should_receive(:initial)

      subject
    end
  end

  describe '#initial' do
    subject { instance.initial }

    it 'adds message to users messages' do
      subject
      expect(user.messages.size).to eq(1)
    end

    it 'returns messages' do
      expect(subject).to be_an_instance_of(Array)
    end
  end
end
