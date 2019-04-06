# spec/requests/validation_requests_spec.rb
require 'rails_helper'

RSpec.describe 'ValidationRequest API', type: :request do

  # Test suite for POST /validation_requests
  describe 'POST /api/validation_requests' do

    context 'when the request has no email' do
      before { post '/api/validation_requests', params: {}}

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end

      it 'returns a validation failure message' do
        expect(json['message']).to eq("Bad Request... No email to validate!")
      end
    end

    context 'when the request is valid' do
      before { post '/api/validation_requests', params: { email: 'tamer.bhgt@gmail.com' } }

      it 'creates a validation_request' do
        expect(json['message']).to eq("Valid SMTP domain!")
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/validation_requests', params: { email: 'test@test.com' } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a validation failure message' do
        expect(json['message']).to eq("Invalid SMTP domain!")
      end
    end

    #context 'when the request exceed 5 requests limit' do
    #  before { post '/validation_requests', params: { email: 'tamer.bhgt@gmail.com'} }

    #  it 'returns status code 405' do
    #    expect(response).to have_http_status(405)
    #  end

    #  it 'returns a validation failure message' do
    #    expect(json['message']).to eq("Validation Request denied: At most 5 api requests per second are allowed!")
    #  end
    #end
  end
end
