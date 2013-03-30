require 'spec_helper'

describe PostOffice::Postman do
  let(:instance) { described_class.new }

  describe '.pickup' do
    subject { described_class.pickup }

    let(:emails) { [ email ] }
    let(:email) {
      fire_double(
        'Mail::Message'
      )
    }

    it 'passes emails to the post office receiver' do
      GmailService.should_receive(:retrieve).
        and_return(emails)

      PostOffice.should_receive(:receiver).
        with(emails)

      subject
    end
  end
end
