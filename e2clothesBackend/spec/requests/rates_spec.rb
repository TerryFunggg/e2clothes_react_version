require 'rails_helper'

RSpec.describe 'Rates', type: :request do
  let!(:rates) { create_list(:rate, 5) }
  let(:rate_id) { rates.first.id }
  describe 'GET /rates' do
    # make http GET request before example
    before { get '/api/rates' }
    it 'return rates' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /rates/:id' do
    before { get "/api/rates/#{rate_id}" }

    context 'when the record exists' do
      it 'returns the rate' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(rate_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:rate_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns rate not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Rate with 'id'=10\"}")
      end
    end
  end

  describe 'POST /rates' do
    # valid payload
    let(:product) { create(:product) }
    let(:user) { create(:user) }
    let(:valid_attr) { JSON.parse(build(:rate, user_id: user.id, product_id: product.id).to_json) }

    context 'when the record valid' do
      before { post '/api/rates', params: valid_attr }

      it 'create a rates' do
        expect(json['user_id']).to eq(user.id)
        expect(json['product_id']).to eq(product.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/rates', params: { name: 'test' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /rates/:id' do
    let(:valid_attr) { { name: 'test' } }

    context 'when the record exists' do
      before { put "/api/rates/#{rate_id}", params: valid_attr }

      it 'updates a record' do
        expect(response.body).to be_empty
      end

      it 'updates status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE rates/:id' do
    before do
      rates = create(:rate)
      delete "/api/rates/#{rates.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
