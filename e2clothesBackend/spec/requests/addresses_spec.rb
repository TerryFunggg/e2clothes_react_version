require 'rails_helper'

RSpec.describe 'Addresses', type: :request do
  let!(:addresses) { create_list(:address, 10) }
  let(:address_id) { addresses.first.id }
  describe 'GET /addresses' do
    # make http GET request before example
    before { get '/api/addresses' }
    it 'return addresses' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /addresses/:id' do
    before { get "/api/addresses/#{address_id}" }

    context 'when the record exists' do
      it 'returns the address' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(address_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:address_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns address not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Address with 'id'=10\"}")
      end
    end
  end

  describe 'POST /addresses' do
    # valid payload
    let(:valid_attr) { JSON.parse(build(:address, zip_code: '123').to_json) }

    context 'when the record valid' do
      before { post '/api/addresses', params: valid_attr }

      it 'create a address' do
        expect(json['zip_code']).to eq('123')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/addresses', params: { city: 'Mary' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /addresses/:id' do
    let(:valid_attr) { { city: 'hongkong' } }

    context 'when the record exists' do
      before { put "/api/addresses/#{address_id}", params: valid_attr }

      it 'updates a record' do
        expect(response.body).to be_empty
      end

      it 'updates status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE addresses/:id' do
    before do
      address = create(:address)
      delete "/api/addresses/#{address.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
