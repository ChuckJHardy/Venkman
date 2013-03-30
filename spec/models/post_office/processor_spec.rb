require 'spec_helper'

describe PostOffice::Processor do
  let(:instance) { described_class.new(email) }
  let(:email) {
    fire_double(
      'Mail::Message',
      :to => address
    )
  }

  let(:address) { 'venkmanapp+9782364897123@gmail.com' }

  let(:ledger) {
    fire_double(
      'PostOffice::Ledger'
    )
  }

  let(:user) {
    fire_double(
      'User'
    )
  }

  let(:organiser) {
    fire_double(
      'PostOffice::Organiser'
    )
  }

  describe '#initialize' do
    it 'takes an argument' do
      instance
    end
  end

  describe '.process' do
    subject { described_class.process(email) }

    it 'calls off to record' do
      described_class.any_instance.
        should_receive(:record)

      subject
    end
  end

  describe '#record' do
    subject { instance.record }

    before do
      instance.stub(:user => user)
      instance.stub(:organiser => organiser)
    end

    it 'calls post office ledger' do
      PostOffice::Ledger.should_receive(:initial).
        with(user, organiser).
        and_return(ledger)

      expect(subject).to eq(ledger)
    end
  end

  describe '#assigner' do
    subject { instance.user }

    it 'calls post office assigner' do
      PostOffice::Assigner.should_receive(:find).
        with(address).
        and_return(user)

      expect(subject).to eq(user)
    end
  end

  describe '#organiser' do
    subject { instance.organiser }

    it 'calls post office organiser' do
      PostOffice::Organiser.should_receive(:initial).
        with(email).
        and_return(organiser)

      expect(subject).to eq(organiser)
    end
  end
end
