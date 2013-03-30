require 'spec_helper'

describe PostOffice::Assigner do
  let(:instance) { described_class.new(addresses) }
  let(:addresses) { [ address ] }
  let(:uid) { '28934678jkh8796jhkg87tasdf' }
  let(:address) { "venkmapapp+#{uid}@gmail.com" }

  describe '#initialize' do
    it 'takes an argument' do
      instance
    end
  end

  describe '.find' do
    subject { described_class.find(addresses) }

    it 'calls off to find' do
      described_class.any_instance.should_receive(:find)

      subject
    end
  end

  describe '#find' do
    subject { instance.find }

    let(:user) {
      fire_double(
        'User'
      )
    }

    let(:matcher) {
      fire_double(
        'UidMatcher',
        :matched => [uid],
        :any? => any
      )
    }

    let(:any) { true }

    context 'with matched uid' do
      it 'returns user' do
        UidMatcher.should_receive(:match).
          with(addresses).
          and_return(matcher)

        User.should_receive(:find_by_uid).
          with(uid).
          and_return(user)

        expect(subject).to eq(user)
      end
    end

    context 'without matched uid' do
      let(:any) { false }

      it 'returns user' do
        UidMatcher.should_receive(:match).
          with(addresses).
          and_return(matcher)

        expect(subject).to eq(nil)
      end
    end
  end
end
