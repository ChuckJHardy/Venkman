require 'spec_helper_lite'
require_relative '../../lib/uid_matcher'

describe UidMatcher do
  let(:instance) { UidMatcher.new(collection) }
  let(:collection) { [ address ] }
  let(:uid) { '28934678jkh8796jhkg87tasdf' }
  let(:address) { "venkmapapp+#{uid}@gmail.com" }
  let(:regex) { /\+(.+)\@/ }

  describe '#initialize' do
    it 'take an argument' do
      instance
    end
  end

  describe '.match' do
    subject { described_class.match(collection) }

    it 'calls off to process' do
      described_class.any_instance.should_receive(:process)

      subject
    end
  end

  describe '#process' do
    subject { instance.process }

    it 'matches elements in collection and returns self' do
      address.should_receive(:match).
        with(regex)

      expect(subject).to be_an_instance_of(UidMatcher)
    end
  end

  describe '#matched' do
    subject { instance.matched }

    before { instance.process }

    context 'no match' do
      let(:address) { 'venkmanapp@gmail.com' }

      it 'returns empty array' do
        expect(subject).to eq([])
      end
    end

    context 'single element' do
      it 'returns matched uid' do
        expect(subject).to eq([uid])
      end
    end

    context 'multiple elements' do
      let(:collection) { [ address, address ] }

      it 'returns matched uids' do
        expect(subject).to eq([uid, uid])
      end
    end
  end

  describe '#any?' do
    subject { instance.any? }

    it 'returns false' do
      expect(subject).to be_false
    end
  end
end
