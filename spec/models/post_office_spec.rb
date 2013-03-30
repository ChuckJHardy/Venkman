require 'spec_helper'

describe PostOffice do
  let(:instance) { described_class.new(emails) }
  let(:emails) { [ email ] }
  let(:email) {
    fire_double(
      'Mail::Message'
    )
  }

  describe '#initialize' do
    it 'takes an argument' do
      instance
    end
  end

  describe '.receiver' do
    subject { described_class.receiver(emails) }

    it 'calls handover' do
      described_class.any_instance.
        should_receive(:handover)

      subject
    end
  end

  describe '#handover' do
    subject { instance.handover }

    it 'calls post office processor for each email' do
      PostOffice::Processor.should_receive(:process).
        with(email)

      subject
    end
  end
end
