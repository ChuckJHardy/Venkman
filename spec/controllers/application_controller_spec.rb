require 'spec_helper'

describe ApplicationController do
  shared_examples_for "any request" do
    context "CORS requests" do
      it "sets the Access-Control-Allow-Origin header to allow CORS from anywhere" do
        expect(response.headers['Access-Control-Allow-Origin']).to eq('*')
      end

      it "allows general HTTP methods thru CORS (GET/POST/PUT/DELETE)" do
        response.header['Access-Control-Allow-Methods'].tap do |header|
          %w{GET POST PUT DELETE OPTIONS}.each do |method|
            expect(header).to include(method)
          end
        end
      end

      it 'allows stated headers' do
        response.header['Access-Control-Allow-Headers'].tap do |header|
          %w{X-Requested-With X-Prototype-Version Content-Type}.each do |method|
            expect(header).to include(method)
          end
        end
      end

      it 'has a max age' do
        expect(response.header['Access-Control-Max-Age']).to eq('1728000')
      end
    end
  end

  describe "HTTP OPTIONS requests" do
    before { process :server_status, nil, nil, nil, 'OPTIONS' }

    it_should_behave_like "any request"

    it "should be succesful" do
      expect(response).to be_success
    end

    it 'returns blank string' do
      expect(response.body).to eq(' ')
    end
  end
end
