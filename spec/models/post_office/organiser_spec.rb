require 'spec_helper'

describe PostOffice::Organiser do
  let(:instance) { described_class.new(email) }
  let(:email) {
    fire_double(
      'Mail::Message',
      :subject => email_subject,
      :body => email_body
    )
  }

  let(:email_body) {
    fire_double(
      'Mail::Body',
      :decoded => email_decoded_body
    )
  }

  let(:email_subject) { 'Test Subject' }
  let(:email_decoded_body) { 'Test Body' }

  describe '#initialize' do
    it 'takes an argument' do
      instance
    end
  end

  describe '.initial' do
    subject { described_class.initial(email) }

    it 'calls off to initial' do
      described_class.any_instance.should_receive(:initial)

      subject
    end
  end

  describe '#initial' do
    subject { instance.initial }

    let(:expected_hash) {
      {
        subject: email_subject,
        body: email_decoded_body
      }
    }

    it 'returns a hash' do
      expect(subject).to eq(expected_hash)
    end
  end
end
