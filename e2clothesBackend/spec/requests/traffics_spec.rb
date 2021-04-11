require 'rails_helper'

RSpec.describe 'Traffics', type: :request do
  let!(:traffics) { create_list(:traffic, 5) }
  let(:traffic_id) { traffics.first.id }
  describe 'GET /traffics' do
    # make http GET request before example
    before { get '/api/traffics' }
    it 'return traffics' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /traffics/:id' do
    before { get "/api/traffics/#{traffic_id}" }

    context 'when the record exists' do
      it 'returns the traffic' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(traffic_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does exist' do
      let(:traffic_id) { 10 }

      it 'retruns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns traffic not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find Traffic with 'id'=10\"}")
      end
    end
  end

  describe 'POST /traffics' do
    # valid payload
    let(:product) { create(:product) }
    let(:user) { create(:user) }
    let(:valid_attr) { JSON.parse(build(:traffic, user_id: user.id, product_id: product.id).to_json) }

    context 'when the record valid' do
      before { post '/api/traffics', params: valid_attr }

      it 'create a traffics' do
        expect(json['user_id']).to eq(user.id)
        expect(json['product_id']).to eq(product.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/traffics', params: { name: 'test' } }

      it 'retruns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed/)
      end
    end
  end

  describe 'PUT /traffics/:id' do
    let(:valid_attr) { { name: 'test' } }

    context 'when the record exists' do
      before { put "/api/traffics/#{traffic_id}", params: valid_attr }

      it 'updates a record' do
        expect(response.body).to be_empty
      end

      it 'updates status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE traffics/:id' do
    before do
      traffics = create(:traffic)
      delete "/api/traffics/#{traffics.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
