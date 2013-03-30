require 'spec_helper'

describe GmailService do
  let(:instance) { described_class.new }

  describe '.retrieve' do
    subject { described_class.retrieve }

    it 'calls off to messages' do
      described_class.any_instance.should_receive(:messages)

      subject
    end
  end

  describe '#messages' do
    subject { instance.messages }

    let(:mailer) {
      fire_double(
        'Gmailish::Account',
        :messages => messages
      )
    }

    let(:messages) { [ message ] }
    let(:message) {
      fire_double(
        'Mail::Message'
      )
    }

    let(:username) { 'venkmanapp@gmail.com' }
    let(:password) { 'ABC123456' }

    before do
      ENV.stub(:[]).
        with("VENKMAN_GMAIL_EMAIL").
        and_return(username)

      ENV.stub(:[]).
        with("VENKMAN_GMAIL_PASSWORD").
        and_return(password)
    end

    it 'returns messages' do
      Gmailish::Account.should_receive(:process).
        with(username, password).
        and_return(mailer)

      expect(subject).to eq(messages)
    end
  end
end
