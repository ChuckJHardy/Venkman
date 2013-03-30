require 'spec_helper'
require 'sidekiq/testing'

describe PostmanPickup do
  let(:instance) { described_class.new }

  describe '#worker' do
    subject { PostmanPickup.perform_async }

    it 'loads the job' do
      expect { subject }.to change(PostmanPickup.jobs, :size).by(1)
    end
  end

  describe '#perform' do
    subject { instance.perform }

    it 'calls off to the postman' do
      PostOffice::Postman.should_receive(:pickup)

      subject
    end
  end
end
