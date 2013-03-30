require 'spec_helper_lite'
require_relative '../../lib/unique_identifier'

describe UniqueIdentifier do
  let(:instance) { UniqueIdentifier.new(string) }
  let(:string) { 'chuckjhardy@gmail.com' }
  let(:time) { Time.parse("2013-03-29 15:01:32 +0000") }

  before { Time.stub(:now => time) }

  describe '#initialize' do
    it 'takes arguments' do
      instance
    end
  end

  describe '.for' do
    subject { described_class.for(string) }

    it 'calls off to generate' do
      described_class.any_instance.should_receive(:generate)

      subject
    end
  end

  describe '#generate' do
    subject { instance.generate }

    let(:expected_hex) { "chuckjhardy@gmail.com1364569292" }
    let(:hex) { "696768d1b9e0291ee37a2ef4ce8253e4" }

    it 'return a MD5 hash' do
      Digest::MD5.should_receive(:hexdigest).
        with(expected_hex).
        and_return(hex)

      expect(subject).to eq(hex)
    end
  end
end
